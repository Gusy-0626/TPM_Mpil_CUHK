<div align=center>
 
# Documentation for TPM (Public_Trial)

</div>

# Front Panel

This is the front panel *(demo)* of our Two Photon Microscope.
<center>

<img src="https://raw.githubusercontent.com/chenbx996/Documentation/master/Picture1.png">

</center>

 - Parameters such as scan ranges and steps are on the upright corner, which should be modified when condition is at <**No pics**>. In general, **RangeX** should be less than $120\mu m$, **RangeY** should be less than $60\mu m$, while **StepX & StepY** be greater than $0.3\mu m$. The image resolution is calculated automatically.
 - In the middle of first row, there are two sliders. The left slider named ***Basis*** sets a threhold for noise reduction, the other named ***Swing*** can set the brightness for the frame when ***Auto Swing*** is off. The ***Auto Swing*** button is on at the beginning of <**Imaging**> by default.
 - The waveform chart is to detect faint singals, sometimes this chart indicates the next movement of observation.
 - The ***Delay time*** is set to prevent data overflow. Elements in queue will grow if ***Delay time*** is too long, which should not happen in normal conditions.
 - The bottom row is to monitor DMD status. The numbers in the red box should all be 0, otherwise the DMD is in wrong status. ***Progress bar*** indicates the percentage of patterns loaded.


<div align=center><img src="https://raw.githubusercontent.com/Gusy-0626/fig_TPM/master/DMDerr.PNG" width="50%" height="50%" /></div>


 - ***Stop*** button stops <**Projecting**> condition, ***Stop Imaging*** button stops <**Imaging**> condition. The ~~biiiiiiiiiiiiig~~ ***Quit*** button shutdowns the whole project when not in <**Imaging**> condition.


# Execution Process
This project uses Labview to control and image the system. The basic front panel is shown in Figure 1. The specific modules are explained as follows table:



| <center>Block</center> | <center>Function</center> |
| -------- | -------- |
|<center>Image</center>     |<center> *Image display*</center>    |
| <center>Threshold Setting</center>     | <center>*Set the threshold to distinguish the sample and background*</center>    |
|<center>Condition Control</center>    | <center>*Display and change the state of program execution*</center>     |
|<center>X/Y number</center>|<center>*Set the scan step and the number of scan points in the XY direction*</center>|center>*Set the delay between reading data and storing data*</center>|
|<center>Loading Process</center>|<center>*Display DMD saving process*</center>|
|<center>DMD type</center>|<center>*Determine whether the program is loaded the hardwares such as a DMD successfully.*</center>|
|<center>After over sampling-average</center>|<center>*Display the wave with an oscilloscope to find the pollen in the dark field*</center>|




<center>
<img src="https://raw.githubusercontent.com/chenbx996/Documentation/master/State%20conditions.png" width="80%" height="80%"/>

<font size="2" font face="Times New Roman">Figure2 Condition Control of the Front Block</font>
</center>



<center>
<img src="https://raw.githubusercontent.com/chenbx996/Documentation/master/Picture2.png" width="80%" height="80%"/>

<font size="2" font face="Times New Roman">Figure 3 Flow chart of the state transitions</font>
</center>

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

<center>
<img src="https://raw.githubusercontent.com/chenbx996/Documentation/master/1816330721.jpg" alt="Figure4 Entire condition of FPGA program" />
<font size="2" font face="Times New Roman">Figure 4 Entirety of FPGA program</font>
</center>

## FPGA Initialization
This program use first three frames to initialize the hardwares:

<center>
<img src="https://raw.githubusercontent.com/chenbx996/Documentation/master/FPGA%20initialization1.png"/>
<img src="https://raw.githubusercontent.com/chenbx996/Documentation/master/FPGA%20initialization2.png"/>
<img src="https://raw.githubusercontent.com/chenbx996/Documentation/master/FPGA%20initialization3.png"/>
<font size="2" font face="Times New Roman">Figure 5 Initialization of the hardwares</font>
</center>

## Main Functions
In the last frame of the sequence structure, two channels of analog signals from PMT are collected in the frequency of 80MHz. Data after calculation are transmitted in the frequency of 20KHz. This program also output a trigger rising edge for DMD in synchrony with data transmission.
<center>
<img src="https://raw.githubusercontent.com/Gusy-0626/fig_TPM/master/TPMworkflow.PNG" />
</center>

The data opration will not begin before receiving signal from the host. In the demo program, number **1** is set as the start signal. The signal receiving module is on the left of figure below:
<center>
<img src="https://raw.githubusercontent.com/Gusy-0626/fig_TPM/master/hosttotarget.PNG" width="80%" height="80%"/>
</center>

Generate rising edge trigger for DMD.
<center>
<img src="https://raw.githubusercontent.com/Gusy-0626/fig_TPM/master/trigger.PNG" width="80%" height="80%"/>
</center>

The data acquisition, calculation, and transimission functions are realized below:
<center>
<img src="https://raw.githubusercontent.com/Gusy-0626/fig_TPM/master/FPGAdataoperation.PNG" />
</center>

 - In the **red** circle, we extract **2048** data from **4k** data, set other data to **0**. When DMD changes pattern, it will go through some vibrations before becoming still, under which condition the data collected are not reliable.
 - In the **green** circle, the raw **14bit** analog data is transferred to **16bit** data.
 - In the **blue** circle, two channels of **32bit** data is combined in to one **64bit** data. *(In case of data overflow, we changed datatype from **16bit** to **32bit** unsigned integer in the first place)*


# Host Program
Host Program is based on the Sequence Structure: **Parameters Initialization**, **Main Body**, which is divided into 5 cases according to the introduction of the Condition Control in the Execution Process:<**No pics**>, <**Loading**>, <**Idle**>, <**Projecting**> and <**Imaging**>, and **Ending Process**.


<center>
<img src="https://raw.githubusercontent.com/chenbx996/Documentation/master/webwxgetmsgimg%20(5).jpg" />
<font size="2" font face="Times New Roman">Figure 6 Entirety of Host Program</font>
</center>



## Parameters Initialization

<center>
<img src="https://raw.githubusercontent.com/chenbx996/Documentation/master/initialization6.jpg" />
<img src="https://raw.githubusercontent.com/chenbx996/Documentation/master/initialization7.jpg" />
<img src="https://raw.githubusercontent.com/chenbx996/Documentation/master/initialization8.jpg" width="120"/>

<font size="2" font face="Times New Roman">Figure 7 Parameters Initialization</font>
</center>

There are 3 parts in this frame:
* Define and enable 5 conditions and 6 buttons,
* Find the target program for the Host and reset it,
* Determine if the hardware is loaded. The condition will be displayed on the **Front Panel**.

## Main Body



<center>
<img src="https://raw.githubusercontent.com/chenbx996/Documentation/master/mainbody1.jpg" />
<font size="2" font face="Times New Roman">Figure 8 parameters setting</font>
</center>

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

<center>
<img src="https://raw.githubusercontent.com/chenbx996/Documentation/master/cluster%20parameters.jpg" />
<font size="2" font face="Times New Roman">Figure 8 parameters setting</font>
</center>


<center>
<img src="https://raw.githubusercontent.com/chenbx996/Documentation/master/cluster.jpg" width="30%" height="30%"/>

<font size="2" font face="Times New Roman">Figure 9 cluster</font>
</center>

## Boy next door

## Deep dark fantasy


# Two-Channel Pollen Imaging
<center>
<img src="https://raw.githubusercontent.com/chenbx996/Documentation/master/two%20photon%20imaging.png" />

<font size="2" font face="Times New Roman">Figure 10 Principle of Two-Channel Pollen Imaging </font>
</center>

Figure 10 shows the principle of the Two-Channel Pollen Imaging. The pollens put in a slide emit fluorescent after absorbing photon from laser. Fluorescent light is divided into 2 parts by wavelength. Each part is detected by a PMT. The data can be acquired from FPGA module and a figure can be shown by Host Program.


<center>
<img src="https://raw.githubusercontent.com/chenbx996/Documentation/master/Two%20photon%20imaging%20program%20structure.png" />

<font size="2" font face="Times New Roman">Figure 10 Principle of Two-Channel Pollen Imaging </font>
</center>
# Specification

**Parameters**
<**condition**>
***button***
++*file.vi*++




<center>
<img src="https://raw.githubusercontent.com/chenbx996/Documentation/master/1816330721.jpg" alt="Figure4 Entire condition of FPGA program" />
<font size="2" font face=" New Roman">Figure 4 Entirety of FPGA program</font>
</center>
