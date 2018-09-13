<div align=center>

# Documentation for TPM (Public_Trial)

</div>


# Notes
Before reading this documentation, there are some materials recommended.
 - [Getting Started With LabVIEW FPGA](http://www.ni.com/tutorial/14532/en/)
 - [NI FlexRIO FPGA Module Installation Guide and Specifications (PXI-7961R)](http://www.ni.com/pdf/manuals/373047b.pdf)
 - [NI 5731/5732/5733/5734R User Guide and Specifications](http://www.ni.com/pdf/manuals/375653a.pdf)
 - [Creating FIFOs in FPGA VIs (FPGA Module)](http://zone.ni.com/reference/en-XX/help/371599P-01/lvfpgahelp/fpga_creating_fifos/)
 - [NI LabVIEW High-Performance FPGA Developer’s Guide](http://download.ni.com/pub/gdc/tut/labview_high-perf_fpga_v1.1.pdf)
 - [IMAQ Vision Concepts Manual (see Chapter 1, specifically)](http://www.ni.com/pdf/manuals/322916b.pdf)
 - [APIs for DMD control (ALP4lib)](https://pypi.org/project/ALP4lib/0.0.3-2/#description)

# Front Panel

This is the front panel of our Two Photon Microscope.
<div align=center>

<img src="https://raw.githubusercontent.com/Gusy-0626/TPM_Mpil_CUHK/master/Figures_for_Documentation/FrontPane1l.JPG">


</div>

<div align=center>

<font size="2" font face="Times New Roman">Figure 1 Front Panel</font>

</div>

 - Parameters such as scan ranges and steps are on the upright corner, which should be modified when condition is at <**No patterns**>. In general, **RangeX** should be less than $60\mu m$, **RangeY** should be less than $120\mu m$, while **StepX & StepY** be greater than $0.3\mu m$. The image resolution is calculated automatically.
 - In the middle of first row, there are 4 sliders. The sliders named ***Basis*** sets a threhold for noise reduction, the others named ***Swing*** can set the brightness for the frame when ***Auto Swing*** is off. The ***Auto Swing*** button is on at the beginning of <**Imaging**> by default.
 - The waveform chart is to detect faint singals, sometimes this chart indicates the next movement of observation.
 - The ***Delay time*** is set to prevent data overflow. Elements in queue will grow if ***Delay time*** is too long, which should not happen in normal conditions.
 - The DMD info box is to monitor DMD status. The numbers in the red box should all be 0, otherwise the DMD is in wrong status. ***Progress bar*** indicates the percentage of patterns loaded.


<div align=center>

<img src="https://raw.githubusercontent.com/Gusy-0626/TPM_Mpil_CUHK/master/Figures_for_Documentation/DMDerr.JPG" width="50%" height="50%" />

</div>

<div align=center>

<font size="2" font face="Times New Roman">Figure 2 DMD Info</font>

</div>


 - ***Stop*** button stops <**Imaging**> condition. The ~~biiiiiiiiiiiiig~~ ***Quit*** button shutdowns the whole project.


You can also see the functions of each module in the following table:

<div align=center>

|<div align=center>Block</div> | <div align=center>Function</div> |
| -------- | -------- |
|<div align=center>Image</div>     |<div align=center> *Image display*</div>    |
| <div align=center>Image Adjust</div>     | <div align=center>*Set the threshold and amplitude of displaying*</div>    |
|<div align=center>Condition Control</div>    | <div align=center>*Display and change the state of program execution*</div>     |
|<div align=center>Parameters</div>|<div align=center>*Set the scan step and the number of scan points in the XYZ direction*</div>
|<div align=center>Loading Process</div>|<div align=center>*Display DMD holographic patterns loading process*</div>|
|<div align=center>DMD Info</div>|<div align=center>*Determine if the DMD is loaded successfully.*</div>|
|<div align=center>Raw Data</div>|<div align=center>*Display the raw data with an oscilloscope to find specimen*</div>|

</div>

# Execution Process
This project uses Labview to control the whole system.


<div align=center>
<img src="https://raw.githubusercontent.com/Gusy-0626/TPM_Mpil_CUHK/master/Figures_for_Documentation/State_Conditions.JPG" width="80%" height="80%"/>

<font size="2" font face="Times New Roman">Figure 3 Condition Control of the Front Block</font>
</div>



<div align=center>
<img src="https://raw.githubusercontent.com/Gusy-0626/TPM_Mpil_CUHK/master/Figures_for_Documentation/Program_Flowchart.png" width="80%" height="80%"/>

<font size="2" font face="Times New Roman">Figure 4 Flow chart of the state transitions</font>
</div>

In particular, in the Condition Control, we use the form of Figure 4 for state transitions:


 - When the program starts running, it enters the <**No patterns**> state and waits. 
 - After clicking the ***Load patterns*** button, the program starts the loading of the DMD holographic patterns, which is the <**Loading**> condition. 
 - The program enters <**Idle**> condition when the DMD patterns are loaded successfully or <**Imaging**> condition stops. If ***Free patterns*** is pressed, the DMD releases the loaded patterns and the program returns to the <***No pics***> condition; If ***Proj&Image*** button is pressed, the program enters <**Imaging**> condition.
 - In the <**Imaging**> condition, click ***Stop*** to stop displaying the image and enter the <**Idle**> state to wait.
 - The entire Condition Control is based on a while loop, and clicking ***Quit*** stops the whole program.


# FPGA Program
The FPGA Program, namely ++*DMD_Control_PXI_Acq.vi*++, is estiblished for frequency division from **Sample Clock**(80 MHz)，sampling with PMT and transferring data from target(**NI PXIe 7961R, NI 5732**) to host(**Computer**).
## Overview
The FPGA program is a sequence structure consist of four frames. 

<div align=center>
<img src="https://raw.githubusercontent.com/Gusy-0626/TPM_Mpil_CUHK/master/Figures_for_Documentation/fpga.png" alt="Figure4 Entire condition of FPGA program" />
<font size="2" font face="Times New Roman">Figure 5 Entirety of FPGA program</font>
</div>

## FPGA Initialization
This program use first three frames to initialize the hardwares:

<div align=center>
<img src="https://raw.githubusercontent.com/chenbx996/Documentation/master/FPGA%20initialization1.png"/>
<img src="https://raw.githubusercontent.com/chenbx996/Documentation/master/FPGA%20initialization2.png"/>
<img src="https://raw.githubusercontent.com/chenbx996/Documentation/master/FPGA%20initialization3.png"/>
<font size="2" font face="Times New Roman">Figure 6 Initialization of the hardwares</font>
</div>

## Main Functions
In the last frame of the sequence structure, two channels of analog signals from PMT are collected in the frequency of 80MHz. Data after calculation are transmitted in the frequency of 20KHz. This program also output a trigger rising edge for DMD in synchrony with data transmission.
<div align=center>
<img src="https://raw.githubusercontent.com/Gusy-0626/TPM_Mpil_CUHK/master/Figures_for_Documentation/TPMworkflow.PNG" />
</div>

<div align=center>

<font size="2" font face="Times New Roman">Figure 7 FPGA to Host Flow Chart</font>

</div>

The data opration will not begin before receiving signal from the host. In this program, **Freqency Division**(typically 4k) and **Abandoned Number**(typically 800) are set as the start signal. The signal receiving module is on the left of figure below:
<div align=center>
<img src="https://raw.githubusercontent.com/Gusy-0626/TPM_Mpil_CUHK/master/Figures_for_Documentation/hosttotarget.PNG"/>
</div>

<div align=center>

<font size="2" font face="Times New Roman">Figure 8 Data acquisition begin</font>

</div>

Generate rising edge trigger for DMD.
<div align=center>

<img src="https://raw.githubusercontent.com/Gusy-0626/TPM_Mpil_CUHK/master/Figures_for_Documentation/trigger.PNG"/>

</div>

<div align=center>

<font size="2" font face="Times New Roman">Figure 9 Rising edge trigger generation</font>

</div>


The data acquisition, calculation, and transimission functions are realized below:
<div align=center>

<img src="https://raw.githubusercontent.com/Gusy-0626/TPM_Mpil_CUHK/master/Figures_for_Documentation/FPGAdata_opration.JPG" />

</div>

<div align=center>

<font size="2" font face="Times New Roman">Figure 10 Data operation in FPGA</font>

</div>

 - In the **red** circle, we abandon certain number of data from **Frequency Div** data (typically abandon 800 data every 4k data), set these abandoned data to **0**. The reason is that when DMD changes pattern, it will go through some vibrations before becoming still, under which condition the data collected are not reliable.
 - In the **green** circle, the raw **14bit** analog data is transferred to **16bit** data.



 - In the **blue** circle, two channels of **32bit** data is combined in to one **64bit** data. *(In case of data overflow, we changed datatype from **16bit** to **32bit** unsigned integer in the first place)*



# Host Program
Host Program is based on the Sequence Structure: **Parameters Initialization**, **Main Body**, which is divided into 5 cases according to the introduction of the Condition Control in the Execution Process:<**No patterns**>, <**Loading**>, <**Idle**>, <**Projecting**> and <**Imaging**>, and **Ending Process**.


<div align=center>
<img src="https://raw.githubusercontent.com/Gusy-0626/TPM_Mpil_CUHK/master/Figures_for_Documentation/host_imaging.png" />
<font size="2" font face="Times New Roman">Figure 11 Entirety of Host Program</font>
</div>



## Parameters Initialization

<div align=center>

<img src="https://raw.githubusercontent.com/Gusy-0626/TPM_Mpil_CUHK/master/Figures_for_Documentation/Initialization.JPG" />

<font size="2" font face="Times New Roman">Figure 12 Parameters Initialization </font>



</div>

There are 4 parts in this frame:
* Find the target program for the Host and reset it;
* Search for DMD and return certain parameters of the DMD. These parameters will be displayed on the **Front Panel**;
* Define, enable, and initialize 5 conditions and 5 buttons;
* Initialize the library path


## Main Body

### Condition Initialization

<div align=center>
<img src="https://raw.githubusercontent.com/Gusy-0626/TPM_Mpil_CUHK/master/Figures_for_Documentation/State_Change.JPG" />
<font size="2" font face="Times New Roman">Figure 13 Parameters setting</font>
</div>



\
In the main body, the program first confirm the condition, enable or disable the buttons and turn the LEDs of the conditions on or off. The specific process is listed as  fake codes:
```javascript
if Condition!=Condition_Before
switch(Condition)
{
case "Idle":

Idle=1;
Autoswing=Image=Stop=Free_patterns=Project=Load_patterns=0;
Projecting=No_patterns=Imaging=Loading=0;
Proj&Image_button=Free_patterns_button="Enabled";
Load_patterns_button=Stop_button="Disabled and Grayed out";

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

### Condition <**Imaging**>
Condition Imaging is consist of 4 while loops: "Producer","Consumer","Error Check", and "Separate Channel".
It will be too hard to read if explaining every detail in this manual. So there are some simplified chart for this **Producer&Consumer** structure.

#### Producer Loop

<div align=center>
<img src="https://raw.githubusercontent.com/Gusy-0626/TPM_Mpil_CUHK/master/Figures_for_Documentation/Producer.JPG" />
</div>

<div align=center>

<font size="2" font face="Times New Roman">Figure 14 Producer Loop </font>

</div>

Simplified Chart：
<div align=center>
<img src="https://raw.githubusercontent.com/Gusy-0626/TPM_Mpil_CUHK/master/Figures_for_Documentation/Producer_Chart.jpg" />
</div>

<div align=center>

<font size="2" font face="Times New Roman">Figure 15 Producer Chart</font>

</div>

#### Consumer Loop
<div align=center>
<img src="https://raw.githubusercontent.com/Gusy-0626/TPM_Mpil_CUHK/master/Figures_for_Documentation/Consumer.JPG" />
</div>

<div align=center>

<font size="2" font face="Times New Roman">Figure 16 Consumer Loop</font>

</div>

Simplified Chart：
<div align=center>
<img src="https://raw.githubusercontent.com/Gusy-0626/TPM_Mpil_CUHK/master/Figures_for_Documentation/Consumer_Chart.jpg" />
</div>

<div align=center>

<font size="2" font face="Times New Roman">Figure 17 Consumer Chart</font>

</div>

#### Error Check
<div align=center>
<img src="https://raw.githubusercontent.com/Gusy-0626/TPM_Mpil_CUHK/master/Figures_for_Documentation/Check.JPG" />
</div>

<div align=center>

<font size="2" font face="Times New Roman">Figure 18 Error Check Loop</font>

</div>

The Error Check Loop is just to be rigorous.

#### Separate Channel
<div align=center>
<img src="https://raw.githubusercontent.com/Gusy-0626/TPM_Mpil_CUHK/master/Figures_for_Documentation/New_Window.JPG" />
</div>

<div align=center>

<font size="2" font face="Times New Roman">Figure 19 Separate Channel Loop</font>

</div>

This while loop is to control the window of separate-channel displaying. When ***New window*** button is clicked, there will be a new window screening two channels separately. The window will be closed when click the ***Stop*** button on the new window.

### Other Conditions
In other conditions such as <**No Sequence**> and <**Idle**>, the program only waits for button clicking. <**Loading**> and <**Projecting**> are the in same logic with the manual of [ALP4lib](https://pypi.org/project/ALP4lib/0.0.3-2/#description), which contains APIs to control the DMD.



## Two-Channel Pollen Imaging
<div align=center>
<img src="https://raw.githubusercontent.com/Gusy-0626/TPM_Mpil_CUHK/master/Figures_for_Documentation/Two_photon_imaging.png" />

<font size="2" font face="Times New Roman">Figure 20 Principle of Two-Channel Pollen Imaging </font>
</div>

Figure 10 shows the principle of the Two-Channel Pollen Imaging. The pollens put in a slide emit fluorescent after absorbing photon from laser. Fluorescent light is divided into 2 parts by wavelength. Each part is detected by a PMT. The data are input to the FPGA module and a figure then be obtained by Host Program.

<div align=center>
<img src="https://raw.githubusercontent.com/Gusy-0626/TPM_Mpil_CUHK/master/Figures_for_Documentation/DatabitFPGA.png" width="100%"/>

<font size="2" font face="Times New Roman">Figure 21 Data type in two-channel pollen imaging </font>
</div>


<div align=center>
<img src="https://raw.githubusercontent.com/Gusy-0626/TPM_Mpil_CUHK/master/Figures_for_Documentation/RGBdata_storage.JPG" />

<font size="2" font face="Times New Roman">Figure 22 IMAQ RGB division  with bytes </font>
</div>


<div align=center>
<img src="https://raw.githubusercontent.com/Gusy-0626/TPM_Mpil_CUHK/master/Figures_for_Documentation/Two_photon_imaging_program_structure.png" />

<font size="2" font face="Times New Roman">Figure 23 Structure of Two-Channel Pollen Imaging Program</font>
</div>

In the HostVI, the part of separated channel imaging is packed as a SubVI, and the two-channel image is shown in the HostVI.


# Specification

**Parameters**

<**condition**>

***button***

++*.vi*++


