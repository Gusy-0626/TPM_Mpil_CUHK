<div align=center>

# Documentation for TPM (Public_Trial)

</div>

# Notes
Before reading this documentation, there are some materials recommended.
 - [Getting Started With LabVIEW FPGA](www.ni.com/tutorial/14532/en/)
 - [NI FlexRIO FPGA Module Installation Guide and Specifications (PXI-7961R)](http://www.ni.com/pdf/manuals/373047b.pdf)
 - [NI 5731/5732/5733/5734R User Guide and Specifications](http://www.ni.com/pdf/manuals/375653a.pdf)
 - [Creating FIFOs in FPGA VIs (FPGA Module)](http://zone.ni.com/reference/en-XX/help/371599P-01/lvfpgahelp/fpga_creating_fifos/)
 - [NI LabVIEW High-Performance FPGA Developer’s Guide](http://download.ni.com/pub/gdc/tut/labview_high-perf_fpga_v1.1.pdf)
 - [IMAQ Vision Concepts Manual (see Chapter 1, specifically)](http://www.ni.com/pdf/manuals/322916b.pdf)

# Front Panel

This is the front panel *(demo)* of our Two Photon Microscope.
<div align=center>

<img src="https://raw.githubusercontent.com/Gusy-0626/fig_TPM/master/FrontPanel_1.jpg">

</div>

 - Parameters such as scan ranges and steps are on the upright corner, which should be modified when condition is at <**No pics**>. In general, **RangeX** should be less than $120\mu m$, **RangeY** should be less than $60\mu m$, while **StepX & StepY** be greater than $0.3\mu m$. The image resolution is calculated automatically.
 - In the middle of first row, there are two sliders. The left slider named ***Basis*** sets a threhold for noise reduction, the other named ***Swing*** can set the brightness for the frame when ***Auto Swing*** is off. The ***Auto Swing*** button is on at the beginning of <**Imaging**> by default.
 - The waveform chart is to detect faint singals, sometimes this chart indicates the next movement of observation.
 - The ***Delay time*** is set to prevent data overflow. Elements in queue will grow if ***Delay time*** is too long, which should not happen in normal conditions.
 - The bottom row is to monitor DMD status. The numbers in the red box should all be 0, otherwise the DMD is in wrong status. ***Progress bar*** indicates the percentage of patterns loaded.


<div align=center>

<img src="https://raw.githubusercontent.com/Gusy-0626/fig_TPM/master/DMDerr.JPG" width="50%" height="50%" />

</div>


 - ***Stop*** button stops <**Projecting**> condition, ***Stop Imaging*** button stops <**Imaging**> condition. The ~~biiiiiiiiiiiiig~~ ***Quit*** button shutdowns the whole project when not in <**Imaging**> condition.


# Execution Process
This project uses Labview to control and image the system. The basic front panel is shown in Figure 1. The specific modules are explained as follows table:



| <div align=center>Block</div> | <div align=center>Function</div> |
| -------- | -------- |
|<div align=center>Image</div>     |<div align=center> *Image display*</div>    |
| <div align=center>Threshold Setting</div>     | <div align=center>*Set the threshold to distinguish the sample and background*</div>    |
|<div align=center>Condition Control</div>    | <div align=center>*Display and change the state of program execution*</div>     |
|<div align=center>X/Y number</div>|<div align=center>*Set the scan step and the number of scan points in the XY direction*</div>|center>*Set the delay between reading data and storing data*</div>|
|<div align=center>Loading Process</div>|<div align=center>*Display DMD saving process*</div>|
|<div align=center>DMD type</div>|<div align=center>*Determine whether the program is loaded the hardwares such as a DMD successfully.*</div>|
|<div align=center>After over sampling-average</div>|<div align=center>*Display the wave with an oscilloscope to find the pollen in the dark field*</div>|




<div align=center>
<img src="https://raw.githubusercontent.com/Gusy-0626/fig_TPM/master/StateConditions.JPG" width="80%" height="80%"/>

<font size="2" font face="Times New Roman">Figure2 Condition Control of the Front Block</font>
</div>



<div align=center>
<img src="https://raw.githubusercontent.com/chenbx996/Documentation/master/Picture2.png" width="80%" height="80%"/>

<font size="2" font face="Times New Roman">Figure 3 Flow chart of the state transitions</font>
</div>

In particular, in the Condition Control, we use the form of Figure 3 for state transitions:


 - When the program starts running, it enters the <**No pics**> state and waits. 
 - After clicking the ***Load pics*** button, the program starts the DMD initialization, which is the <**Loading**> condition. 
 - The program enters <**Idle**> condition when the DMD is initialized successfully. If ***Free pics*** is pressed, the program releases the initialization memory and returns to the <***No pics***> condition; If ***Project*** button is pressed, the program enters <**Projecting**> condition.
 - In the <**Projecting**> condition, click the ***Image*** button to enter the <**Imaging**> state, which is the state to display the images. Click ***Stop Imaging*** to stop displaying the image and enter the <**Idle**> state to wait.
 - The entire Condition Control is based on a while loop, and clicking ***Quit*** stops the program from running.


# FPGA Program
The FPGA Program, namely ++*DMD_Control_PXI_Acq.vi*++, is estiblished for frequency division from **Sample Clock**(80 MHz)，sampling with PMT and transferring data from target(**NI PXIe 7961R, NI 5732**) to host(**Computer**).
## Overview
The FPGA program is a sequence structure consist of four frames. 

<div align=center>
<img src="https://raw.githubusercontent.com/Gusy-0626/fig_TPM/master/fpga.png" alt="Figure4 Entire condition of FPGA program" />
<font size="2" font face="Times New Roman">Figure 4 Entirety of FPGA program</font>
</div>

## FPGA Initialization
This program use first three frames to initialize the hardwares:

<div align=center>
<img src="https://raw.githubusercontent.com/chenbx996/Documentation/master/FPGA%20initialization1.png"/>
<img src="https://raw.githubusercontent.com/chenbx996/Documentation/master/FPGA%20initialization2.png"/>
<img src="https://raw.githubusercontent.com/chenbx996/Documentation/master/FPGA%20initialization3.png"/>
<font size="2" font face="Times New Roman">Figure 5 Initialization of the hardwares</font>
</div>

## Main Functions
In the last frame of the sequence structure, two channels of analog signals from PMT are collected in the frequency of 80MHz. Data after calculation are transmitted in the frequency of 20KHz. This program also output a trigger rising edge for DMD in synchrony with data transmission.
<div align=center>
<img src="https://raw.githubusercontent.com/Gusy-0626/fig_TPM/master/TPMworkflow.PNG" />
</div>

The data opration will not begin before receiving signal from the host. In the demo program, number **1** is set as the start signal. The signal receiving module is on the left of figure below:
<div align=center>
<img src="https://raw.githubusercontent.com/Gusy-0626/fig_TPM/master/hosttotarget.PNG"/>
</div>

Generate rising edge trigger for DMD.
<div align=center>

<img src="https://raw.githubusercontent.com/Gusy-0626/fig_TPM/master/trigger.PNG"/>

</div>


The data acquisition, calculation, and transimission functions are realized below:
<div align=center>

<img src="https://raw.githubusercontent.com/Gusy-0626/fig_TPM/master/FPGAdata_opration.JPG" />

</div>

 - In the **red** circle, we abandon certain number of data from **Frequency Div** data (typically abandon 800 data every 4k data), set these abandoned data to **0**. The reason is that when DMD changes pattern, it will go through some vibrations before becoming still, under which condition the data collected are not reliable.
 - In the **green** circle, the raw **14bit** analog data is transferred to **16bit** data.

<div align=center>
<img src="https://raw.githubusercontent.com/Gusy-0626/fig_TPM/master/DatabitFPGA.png" width="100%"/>
</div>

 - In the **blue** circle, two channels of **32bit** data is combined in to one **64bit** data. *(In case of data overflow, we changed datatype from **16bit** to **32bit** unsigned integer in the first place)*



# Host Program
Host Program is based on the Sequence Structure: **Parameters Initialization**, **Main Body**, which is divided into 5 cases according to the introduction of the Condition Control in the Execution Process:<**No pics**>, <**Loading**>, <**Idle**>, <**Projecting**> and <**Imaging**>, and **Ending Process**.


<div align=center>
<img src="https://raw.githubusercontent.com/Gusy-0626/fig_TPM/master/host_imaging.png" />
<font size="2" font face="Times New Roman">Figure 6 Entirety of Host Program</font>
</div>



## Parameters Initialization

<div align=center>

<img src="https://raw.githubusercontent.com/Gusy-0626/fig_TPM/master/FPGA_init.JPG" />
<img src="https://raw.githubusercontent.com/Gusy-0626/fig_TPM/master/DMD_init.JPG" />
<img src="https://raw.githubusercontent.com/Gusy-0626/fig_TPM/master/components_init.JPG" width="35%"/>
<img src="https://raw.githubusercontent.com/Gusy-0626/fig_TPM/master/path_init.JPG" width="50%"" />

<font size="2" font face="Times New Roman">Figure 7 Parameters Initialization</font>

</div>

There are 4 parts in this frame:
* Find the target program for the Host and reset it;
* Search for DMD and return certain parameters of the DMD. These parameters will be displayed on the **Front Panel**;
* Define, enable, and initialize 5 conditions and 5 buttons;
* Initialize the library path


## Main Body



<div align=center>
<img src="https://raw.githubusercontent.com/chenbx996/Documentation/master/mainbody1.jpg" />
<font size="2" font face="Times New Roman">Figure 8 parameters setting</font>
</div>

\
In the main body, the program first confirm the condition, enable or disable the buttons and turn the booleans of the conditions on or off. The specific process is listed as  fake codes:
```javascript
if state!=state1
switch(state1)
{
case "Idle":

Idle=1;
Autoswing=Image=Stop=Freepics=StopImaging=Project=Loadpics=0;
Projecting=Nopics=imaging=Loading=0;
Project_button=Freepics_button="Enabled";
Loadpics_button=Stop_button=Image_button=StopImaging_button="Disabled and Grayed out";

break;

case "No pics":

*****************

break;


case "Project":

*****************

break;

case "Load pics":

*****************

break;

case "Imaging":

*****************

break;


case "Free pics":

*****************

break;
}

end
```


To simplify the program, the parameters (**RangeX**,**RangeY**,**RangeZ**,**StepX**,**StepY**,**StepZ**...) are packed into a cluster in Figure 8 and 9, we also use the codes to replace the blocks as shown in Figure 10:

<div align=center>
<img src="https://raw.githubusercontent.com/Gusy-0626/fig_TPM/master/Parameters.JPG" />


<font size="2" font face="Times New Roman">Figure 8 parameters setting</font>
</div>


<div align=center>
<img src="https://raw.githubusercontent.com/Gusy-0626/fig_TPM/master/cluster.PNG" width="50%" />

<font size="2" font face="Times New Roman">Figure 9 cluster</font>
</div>




## Two-Channel Pollen Imaging
<div align=center>
<img src="https://raw.githubusercontent.com/chenbx996/Documentation/master/two%20photon%20imaging.png" />

<font size="2" font face="Times New Roman">Figure 10 Principle of Two-Channel Pollen Imaging </font>
</div>

Figure 10 shows the principle of the Two-Channel Pollen Imaging. The pollens put in a slide emit fluorescent after absorbing photon from laser. Fluorescent light is divided into 2 parts by wavelength. Each part is detected by a PMT. The data can be acquired from FPGA module and a figure can be obtained by Host Program. (此处说明IMAQ32位的事)

<div align=center>
<img src="https://raw.githubusercontent.com/Gusy-0626/fig_TPM/master/RGBdata_storage.JPG" />

<font size="2" font face="Times New Roman">Figure 11 IMAQ RGB division  with bytes </font>
</div>


<div align=center>
<img src="https://raw.githubusercontent.com/chenbx996/Documentation/master/Two%20photon%20imaging%20program%20structure.png" />

<font size="2" font face="Times New Roman">Figure 12 Structure of Two-Channel Pollen Imaging Program</font>
</div>

In the HostVI, the part of separated channel imaging is packed as a SubVI, and the two-channel image is shown in the HostVI.


# Specification

**Parameters**
<**condition**>
***button***
++*file.vi*++




<div align=center>
<img src="https://raw.githubusercontent.com/chenbx996/Documentation/master/1816330721.jpg" alt="Figure4 Entire condition of FPGA program" />
<font size="2" font face=" New Roman">Figure 4 Entirety of FPGA program</font>
</div>