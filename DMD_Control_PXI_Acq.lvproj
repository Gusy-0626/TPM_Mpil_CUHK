<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="16008000">
	<Property Name="NI.Project.Description" Type="Str">Example Description:
This example continuously acquires records of analog input data from the NI 5732 adapter module. You can select an AI channel, trigger type, and record size. This VI is compiled for all FPGA targets by default.

VI Configuration:
This example uses the NI PXI-7952R as the FPGA target by default. If you are using another FPGA target, complete the following steps to configure the host VI to use a VI configured for your FPGA target:
1. On the block diagram, right-click the Open FPGA VI Reference (NI PXI-7952R) function and select Configure Open FPGA VI Reference.
2. Browse for a new target by clicking the Browse Project button in the Open VI section.
3. Select the VI under the target that matches your device. Click OK to select this VI.
4. Click OK to exit the dialog box and to apply the new selection to the FPGA VI.
5. Save the VI.

Running the VI:
1. Select a RIO Resource that corresponds to the FPGA device configured above.
2. Configure the AI Channel, Record Size, and Trigger Type controls. If you are using the analog trigger type, configure the Trigger Level (V) control. Set the Sample Rate and Range (V) controls to match the sample rate and input range for your device.
3. Click the run arrow to run the VI.
4. If the Trigger Type is set to Software, click the Software Trigger button to acquire a single record of data. If the Trigger Type is set to Data Edge, a record of data is acquired each time the input signal rises above the trigger level. The AI Channel, Record Size, Trigger Type, and Trigger Level controls can all be configured while the VI is running.  

Execution Steps:
1. Open a session to the FPGA VI and run the VI.
2. Wait for the adapter module to load its default configuration.
3. The AI channel, trigger type, and record size for a single record acquisition are configured.
4. Based on the trigger type, either wait for the software trigger Boolean to assert or configure the desired trigger level and arm the trigger.
5. After the trigger is armed, a single record of data is acquired and read.
6. Stop the VI when the stop button is pressed or when an error has occurred. 
7. Close the FPGA VI reference and display any errors. </Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="NI.SortType" Type="Int">3</Property>
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Library" Type="Folder">
			<Item Name="DMD_Load_Setting.vi" Type="VI" URL="../Library/DMD_Load_Setting.vi"/>
			<Item Name="Array_to_Image.vi" Type="VI" URL="../Library/Array_to_Image.vi"/>
			<Item Name="Multichannel_Division.vi" Type="VI" URL="../Library/Multichannel_Division.vi"/>
			<Item Name="Multichannel_Read.vi" Type="VI" URL="../Library/Multichannel_Read.vi"/>
			<Item Name="Initial.vi" Type="VI" URL="../Library/Initial.vi"/>
			<Item Name="Separated_Image.vi" Type="VI" URL="../Library/Separated_Image.vi"/>
			<Item Name="Contrast_adjust.vi" Type="VI" URL="../Library/Contrast_adjust.vi"/>
			<Item Name="alp4395.dll" Type="Document" URL="../Library/alp4395.dll"/>
			<Item Name="cube.m" Type="Document" URL="../Library/cube.m"/>
			<Item Name="TrajectoryByPoints_3000_withcor_withoutblack.m" Type="Document" URL="../Library/TrajectoryByPoints_3000_withcor_withoutblack.m"/>
			<Item Name="NiFpgaLv.dll" Type="Document" URL="NiFpgaLv.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="nivision.dll" Type="Document" URL="nivision.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="nivissvc.dll" Type="Document" URL="nivissvc.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="../Library/error.llb/Error Cluster From Error Code.vi"/>
			<Item Name="IMAQ ArrayToColorImage" Type="VI" URL="../Library/Basics.llb/IMAQ ArrayToColorImage"/>
			<Item Name="IMAQ Create" Type="VI" URL="../Library/Basics.llb/IMAQ Create"/>
			<Item Name="IMAQ Dispose" Type="VI" URL="../Library/Basics.llb/IMAQ Dispose"/>
			<Item Name="Color (U64)" Type="VI" URL="../Library/Image Controls.llb/Color (U64)"/>
			<Item Name="Image Type" Type="VI" URL="../Library/Image Controls.llb/Image Type"/>
			<Item Name="IMAQ Image.ctl" Type="VI" URL="../Library/Image Controls.llb/IMAQ Image.ctl"/>
		</Item>
		<Item Name="DMD_Control_PXI_Acq.vi" Type="VI" URL="../DMD_Control_PXI_Acq.vi"/>
		<Item Name="PXIe-7961R" Type="FPGA Target">
			<Property Name="AutoRun" Type="Bool">false</Property>
			<Property Name="configString.guid" Type="Str">{023AA419-BDF7-4384-B70B-94BC2612DBC2}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 3 WE;0;WriteMethodType=bool{084485A6-14B5-43D5-91C0-349F095C9CC9}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 1 WE;0;WriteMethodType=bool{0C087041-C96F-4ACB-B715-30E78FCCF938}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 2 Wr Data;0;WriteMethodType=bool{0C51A0EB-6AE3-4F19-B408-CEDB75C2C1F7}431934833ad3e9a7c9cad4e7878a3e65IOModuleID:0x10937576,Version:15.1.0,National Instruments::NI 5732,SyncClock:CLK1026d873eb92e838e923e5b8196b7992824a62159fea15e1e022e16deffac8f0826163cd1f9189ed3770c0bb9fca4fea8070980ef6da90a5d808ef44eb222fccd58946924f69a7a4d28d421e1971d5b5bd914cf2a79dfd4b33c486ed91c079ba20c95cccd3f4a62e414596cffa39b3701a&lt;Array&gt;
&lt;Name&gt;Generics&lt;/Name&gt;
&lt;Dimsize&gt;0&lt;/Dimsize&gt;
&lt;Cluster&gt;
&lt;Name&gt;CLIP Generic&lt;/Name&gt;
&lt;NumElts&gt;5&lt;/NumElts&gt;
&lt;String&gt;
&lt;Name&gt;Name&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;Type&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;Default value&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;Value&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;Description&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;/Cluster&gt;
&lt;/Array&gt;
&lt;Array&gt;
&lt;Name&gt;Clock Connections&lt;/Name&gt;
&lt;Dimsize&gt;2&lt;/Dimsize&gt;
&lt;Cluster&gt;
&lt;Name&gt;CLIP Clock Connection&lt;/Name&gt;
&lt;NumElts&gt;2&lt;/NumElts&gt;
&lt;Cluster&gt;
&lt;Name&gt;CLIP Clock&lt;/Name&gt;
&lt;NumElts&gt;6&lt;/NumElts&gt;
&lt;String&gt;
&lt;Name&gt;LabVIEW name&lt;/Name&gt;
&lt;Val&gt;Clock 40 MHz&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;VHDL name&lt;/Name&gt;
&lt;Val&gt;Clk40&lt;/Val&gt;
&lt;/String&gt;
&lt;DBL&gt;
&lt;Name&gt;Max Freq&lt;/Name&gt;
&lt;Val&gt;40000000.00000000000000&lt;/Val&gt;
&lt;/DBL&gt;
&lt;DBL&gt;
&lt;Name&gt;Min Freq&lt;/Name&gt;
&lt;Val&gt;40000000.00000000000000&lt;/Val&gt;
&lt;/DBL&gt;
&lt;EW&gt;
&lt;Name&gt;Direction&lt;/Name&gt;
&lt;Choice&gt;ToCLIP&lt;/Choice&gt;
&lt;Choice&gt;FromCLIP&lt;/Choice&gt;
&lt;Choice&gt;Bidirectional&lt;/Choice&gt;
&lt;Val&gt;0&lt;/Val&gt;
&lt;/EW&gt;
&lt;String&gt;
&lt;Name&gt;ClockToLinkTo&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;/Cluster&gt;
&lt;Cluster&gt;
&lt;Name&gt;FPGA Clock&lt;/Name&gt;
&lt;NumElts&gt;3&lt;/NumElts&gt;
&lt;String&gt;
&lt;Name&gt;Name&lt;/Name&gt;
&lt;Val&gt;40 MHz Onboard Clock&lt;/Val&gt;
&lt;/String&gt;
&lt;Boolean&gt;
&lt;Name&gt;Use Top Clock&lt;/Name&gt;
&lt;Val&gt;0&lt;/Val&gt;
&lt;/Boolean&gt;
&lt;Boolean&gt;
&lt;Name&gt;Clock From CLIP&lt;/Name&gt;
&lt;Val&gt;0&lt;/Val&gt;
&lt;/Boolean&gt;
&lt;/Cluster&gt;
&lt;/Cluster&gt;
&lt;Cluster&gt;
&lt;Name&gt;CLIP Clock Connection&lt;/Name&gt;
&lt;NumElts&gt;2&lt;/NumElts&gt;
&lt;Cluster&gt;
&lt;Name&gt;CLIP Clock&lt;/Name&gt;
&lt;NumElts&gt;6&lt;/NumElts&gt;
&lt;String&gt;
&lt;Name&gt;LabVIEW name&lt;/Name&gt;
&lt;Val&gt;Sample Clock&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;VHDL name&lt;/Name&gt;
&lt;Val&gt;SampleClkLv&lt;/Val&gt;
&lt;/String&gt;
&lt;DBL&gt;
&lt;Name&gt;Max Freq&lt;/Name&gt;
&lt;Val&gt;80000000.00000000000000&lt;/Val&gt;
&lt;/DBL&gt;
&lt;DBL&gt;
&lt;Name&gt;Min Freq&lt;/Name&gt;
&lt;Val&gt;80000000.00000000000000&lt;/Val&gt;
&lt;/DBL&gt;
&lt;EW&gt;
&lt;Name&gt;Direction&lt;/Name&gt;
&lt;Choice&gt;ToCLIP&lt;/Choice&gt;
&lt;Choice&gt;FromCLIP&lt;/Choice&gt;
&lt;Choice&gt;Bidirectional&lt;/Choice&gt;
&lt;Val&gt;1&lt;/Val&gt;
&lt;/EW&gt;
&lt;String&gt;
&lt;Name&gt;ClockToLinkTo&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;/Cluster&gt;
&lt;Cluster&gt;
&lt;Name&gt;FPGA Clock&lt;/Name&gt;
&lt;NumElts&gt;3&lt;/NumElts&gt;
&lt;String&gt;
&lt;Name&gt;Name&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;Boolean&gt;
&lt;Name&gt;Use Top Clock&lt;/Name&gt;
&lt;Val&gt;0&lt;/Val&gt;
&lt;/Boolean&gt;
&lt;Boolean&gt;
&lt;Name&gt;Clock From CLIP&lt;/Name&gt;
&lt;Val&gt;1&lt;/Val&gt;
&lt;/Boolean&gt;
&lt;/Cluster&gt;
&lt;/Cluster&gt;
&lt;/Array&gt;
{173AB736-AE6E-4D32-AD2E-3443228EAA17}NumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/Initialization Done;0;ReadMethodType=bool{1BE802ED-283C-4B7D-A841-E29879259579}NumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/User Command Status;0;ReadMethodType=U8{1E986F3F-F9DF-416A-9ACA-F27636BF6918}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 0 WE;0;WriteMethodType=bool{1FD8C95B-A53D-4698-9B87-420D27CF72D2}NumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/AI 1 Over Range;0;ReadMethodType=bool{24FA93DA-AEE7-43B6-894F-570BD7679526}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/DIO Port 1 WE;0;WriteMethodType=bool{30D0905D-0FAF-440D-BBF4-78073D8E82CD}"ControlLogic=0;NumberOfElements=133;Type=1;ReadArbs=Arbitrate if Multiple Requestors Only;ElementsPerRead=1;WriteArbs=Arbitrate if Multiple Requestors Only;ElementsPerWrite=1;Implementation=2;Host_to_target;DataType=1000800000000001000940070003553332000100000000000000000000;DisableOnOverflowUnderflow=FALSE"{3EC811B6-E363-4FC2-A6C0-78C90C6AA66D}ResourceName=IO ModuleA_ASample Clock;TopSignalConnect=IO_ModuleA_ASampleClkLv;ClockSignalName=IO_ModuleA_ASampleClkLv;MinFreq=80000000.000000;MaxFreq=80000000.000000;VariableFreq=0;NomFreq=80000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=45.000000;MaxDutyCycle=55.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;{42645120-A796-4392-83CA-BDB7DACDF525}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/User Command;0;WriteMethodType=U8{4D615A83-5944-43C2-A7D0-0DFCE5FC8BFA}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/DIO Port 0 WE;0;WriteMethodType=bool{4F3E3145-2F6A-4A7B-9FEC-518BDFD95F6E}NumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/SPI Read Data;0;ReadMethodType=U8{50107835-FCDF-4764-8C9C-3F3C511A2A37}NumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/User Return;0;ReadMethodType=U16{5150FCD7-5489-4EB3-BCFC-5B5012EC1024}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 0 Wr Data;0;WriteMethodType=bool{5579BF21-F618-44AA-BAB7-9D659DDD842B}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/SPI Device Select;0;WriteMethodType=U8{55BD4204-0920-4BB4-9591-38490A073A9F}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/DIO Port 1 Wr Data;0;WriteMethodType=U8{5F045765-DADE-499E-A676-AFEB6C692253}NumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/AI 0;0;ReadMethodType=U16{5F5BEDA4-29B2-48B2-AE74-775727823EC7}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 3 Wr Data;0;WriteMethodType=bool{6CBCB05E-9479-4A6A-B7FB-CD8A02E47981}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module/SignalList/DIO Port 1 Rd Data;0;ReadMethodType=U8{7944625B-5AB7-4CEA-AE15-DB0B42013669}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module/SignalList/PFI 3 Rd Data;0;ReadMethodType=bool{7ACD5512-AA81-4C36-8F48-546E508E9F31}ResourceName=40 MHz Onboard Clock;TopSignalConnect=RioClk40;ClockSignalName=RioClk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;{7D40381A-49EB-4928-AB5F-DE552D6AC27B}NumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/AI 0 Over Range;0;ReadMethodType=bool{86A88140-24E3-4B23-8D6B-D827DAA43C83}NumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/User Command Idle;0;ReadMethodType=bool{8AAA250B-A288-4BFA-8C93-E9A3C5CBCF6D}NumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/PLL Locked;0;ReadMethodType=bool{93EF48FB-5C5F-4E58-9E8A-2899BCC9C55D}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 1 Wr Data;0;WriteMethodType=bool{96B502D3-977B-4EC4-9D1A-5CB5BDE98728}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module/SignalList/DIO Port 0 Rd Data;0;ReadMethodType=U8{A1C94580-E034-4216-BBDD-0447D0B17A78}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 2 WE;0;WriteMethodType=bool{A82CC67A-BAC3-47D0-B287-7AB4853BD223}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/SPI Write Data;0;WriteMethodType=U16{AECEF0D8-40CE-420C-875C-E224C40F2484}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module/SignalList/PFI 1 Rd Data;0;ReadMethodType=bool{AF381BBF-4993-43D8-B0E9-0428AD000BBA}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module/SignalList/DC Over Voltage;0;ReadMethodType=U8{B8D6A9FC-ABB8-4F87-8389-C1F57D096653}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/SPI Address;0;WriteMethodType=U16{C8754F18-F746-4ED6-A6A8-E4D632860FA7}"ControlLogic=0;NumberOfElements=2047;Type=2;ReadArbs=Arbitrate if Multiple Requestors Only;ElementsPerRead=1;WriteArbs=Arbitrate if Multiple Requestors Only;ElementsPerWrite=1;Implementation=2;Multi_Channel;DataType=100080000000000100094008000355363400010000000000000000000000000000;DisableOnOverflowUnderflow=FALSE"{CAF62FF4-FA07-4702-B99B-34C0CA520998}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/User Data 0;0;WriteMethodType=U8{CC93FEC2-2EAD-4228-9A82-4FE45693F4BC}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/SPI Write;0;WriteMethodType=bool{D0EECF58-116D-4BCA-A88C-C1982A588587}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/User Data 1;0;WriteMethodType=U8{D299B906-FD79-444D-A645-DF4E0711E0F6}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/SPI Read;0;WriteMethodType=bool{D5EEEA61-5986-4026-807B-F63EF7CEBD4D}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module/SignalList/PFI 0 Rd Data;0;ReadMethodType=bool{D7A7BA27-EDE6-490F-A916-B4420F31577A}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/User Command Commit;0;WriteMethodType=bool{E0E357A2-C6FC-41EE-9325-6D169DB7FD56}NumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/User Error;0;ReadMethodType=U8{E1DA2EBB-BC77-4751-A50E-EB738230123E}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module/SignalList/PFI 2 Rd Data;0;ReadMethodType=bool{E9719A58-2C34-4830-8A8A-34685291A794}NumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/AI 1;0;ReadMethodType=U16{F5535155-E68B-48FC-856D-DA1461543EE4}NumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/SPI Idle;0;ReadMethodType=bool{F95181D5-02F3-410C-A733-D9EDC797479C}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/DIO Port 0 Wr Data;0;WriteMethodType=U8PXIe-7961R/RioClk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSPXIE_7961RFPGA_TARGET_FAMILYVIRTEX5TARGET_TYPEFPGA</Property>
			<Property Name="configString.name" Type="Str">40 MHz Onboard ClockResourceName=40 MHz Onboard Clock;TopSignalConnect=RioClk40;ClockSignalName=RioClk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;AI 0 Over RangeNumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/AI 0 Over Range;0;ReadMethodType=boolAI 0NumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/AI 0;0;ReadMethodType=U16AI 1 Over RangeNumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/AI 1 Over Range;0;ReadMethodType=boolAI 1NumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/AI 1;0;ReadMethodType=U16DC Over VoltageNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module/SignalList/DC Over Voltage;0;ReadMethodType=U8DIO Port 0 Rd DataNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module/SignalList/DIO Port 0 Rd Data;0;ReadMethodType=U8DIO Port 0 WEArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/DIO Port 0 WE;0;WriteMethodType=boolDIO Port 0 Wr DataArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/DIO Port 0 Wr Data;0;WriteMethodType=U8DIO Port 1 Rd DataNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module/SignalList/DIO Port 1 Rd Data;0;ReadMethodType=U8DIO Port 1 WEArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/DIO Port 1 WE;0;WriteMethodType=boolDIO Port 1 Wr DataArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/DIO Port 1 Wr Data;0;WriteMethodType=U8Host_to_target"ControlLogic=0;NumberOfElements=133;Type=1;ReadArbs=Arbitrate if Multiple Requestors Only;ElementsPerRead=1;WriteArbs=Arbitrate if Multiple Requestors Only;ElementsPerWrite=1;Implementation=2;Host_to_target;DataType=1000800000000001000940070003553332000100000000000000000000;DisableOnOverflowUnderflow=FALSE"Initialization DoneNumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/Initialization Done;0;ReadMethodType=boolIO Module431934833ad3e9a7c9cad4e7878a3e65IOModuleID:0x10937576,Version:15.1.0,National Instruments::NI 5732,SyncClock:CLK1026d873eb92e838e923e5b8196b7992824a62159fea15e1e022e16deffac8f0826163cd1f9189ed3770c0bb9fca4fea8070980ef6da90a5d808ef44eb222fccd58946924f69a7a4d28d421e1971d5b5bd914cf2a79dfd4b33c486ed91c079ba20c95cccd3f4a62e414596cffa39b3701a&lt;Array&gt;
&lt;Name&gt;Generics&lt;/Name&gt;
&lt;Dimsize&gt;0&lt;/Dimsize&gt;
&lt;Cluster&gt;
&lt;Name&gt;CLIP Generic&lt;/Name&gt;
&lt;NumElts&gt;5&lt;/NumElts&gt;
&lt;String&gt;
&lt;Name&gt;Name&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;Type&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;Default value&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;Value&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;Description&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;/Cluster&gt;
&lt;/Array&gt;
&lt;Array&gt;
&lt;Name&gt;Clock Connections&lt;/Name&gt;
&lt;Dimsize&gt;2&lt;/Dimsize&gt;
&lt;Cluster&gt;
&lt;Name&gt;CLIP Clock Connection&lt;/Name&gt;
&lt;NumElts&gt;2&lt;/NumElts&gt;
&lt;Cluster&gt;
&lt;Name&gt;CLIP Clock&lt;/Name&gt;
&lt;NumElts&gt;6&lt;/NumElts&gt;
&lt;String&gt;
&lt;Name&gt;LabVIEW name&lt;/Name&gt;
&lt;Val&gt;Clock 40 MHz&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;VHDL name&lt;/Name&gt;
&lt;Val&gt;Clk40&lt;/Val&gt;
&lt;/String&gt;
&lt;DBL&gt;
&lt;Name&gt;Max Freq&lt;/Name&gt;
&lt;Val&gt;40000000.00000000000000&lt;/Val&gt;
&lt;/DBL&gt;
&lt;DBL&gt;
&lt;Name&gt;Min Freq&lt;/Name&gt;
&lt;Val&gt;40000000.00000000000000&lt;/Val&gt;
&lt;/DBL&gt;
&lt;EW&gt;
&lt;Name&gt;Direction&lt;/Name&gt;
&lt;Choice&gt;ToCLIP&lt;/Choice&gt;
&lt;Choice&gt;FromCLIP&lt;/Choice&gt;
&lt;Choice&gt;Bidirectional&lt;/Choice&gt;
&lt;Val&gt;0&lt;/Val&gt;
&lt;/EW&gt;
&lt;String&gt;
&lt;Name&gt;ClockToLinkTo&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;/Cluster&gt;
&lt;Cluster&gt;
&lt;Name&gt;FPGA Clock&lt;/Name&gt;
&lt;NumElts&gt;3&lt;/NumElts&gt;
&lt;String&gt;
&lt;Name&gt;Name&lt;/Name&gt;
&lt;Val&gt;40 MHz Onboard Clock&lt;/Val&gt;
&lt;/String&gt;
&lt;Boolean&gt;
&lt;Name&gt;Use Top Clock&lt;/Name&gt;
&lt;Val&gt;0&lt;/Val&gt;
&lt;/Boolean&gt;
&lt;Boolean&gt;
&lt;Name&gt;Clock From CLIP&lt;/Name&gt;
&lt;Val&gt;0&lt;/Val&gt;
&lt;/Boolean&gt;
&lt;/Cluster&gt;
&lt;/Cluster&gt;
&lt;Cluster&gt;
&lt;Name&gt;CLIP Clock Connection&lt;/Name&gt;
&lt;NumElts&gt;2&lt;/NumElts&gt;
&lt;Cluster&gt;
&lt;Name&gt;CLIP Clock&lt;/Name&gt;
&lt;NumElts&gt;6&lt;/NumElts&gt;
&lt;String&gt;
&lt;Name&gt;LabVIEW name&lt;/Name&gt;
&lt;Val&gt;Sample Clock&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;VHDL name&lt;/Name&gt;
&lt;Val&gt;SampleClkLv&lt;/Val&gt;
&lt;/String&gt;
&lt;DBL&gt;
&lt;Name&gt;Max Freq&lt;/Name&gt;
&lt;Val&gt;80000000.00000000000000&lt;/Val&gt;
&lt;/DBL&gt;
&lt;DBL&gt;
&lt;Name&gt;Min Freq&lt;/Name&gt;
&lt;Val&gt;80000000.00000000000000&lt;/Val&gt;
&lt;/DBL&gt;
&lt;EW&gt;
&lt;Name&gt;Direction&lt;/Name&gt;
&lt;Choice&gt;ToCLIP&lt;/Choice&gt;
&lt;Choice&gt;FromCLIP&lt;/Choice&gt;
&lt;Choice&gt;Bidirectional&lt;/Choice&gt;
&lt;Val&gt;1&lt;/Val&gt;
&lt;/EW&gt;
&lt;String&gt;
&lt;Name&gt;ClockToLinkTo&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;/Cluster&gt;
&lt;Cluster&gt;
&lt;Name&gt;FPGA Clock&lt;/Name&gt;
&lt;NumElts&gt;3&lt;/NumElts&gt;
&lt;String&gt;
&lt;Name&gt;Name&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;Boolean&gt;
&lt;Name&gt;Use Top Clock&lt;/Name&gt;
&lt;Val&gt;0&lt;/Val&gt;
&lt;/Boolean&gt;
&lt;Boolean&gt;
&lt;Name&gt;Clock From CLIP&lt;/Name&gt;
&lt;Val&gt;1&lt;/Val&gt;
&lt;/Boolean&gt;
&lt;/Cluster&gt;
&lt;/Cluster&gt;
&lt;/Array&gt;
Multi_Channel"ControlLogic=0;NumberOfElements=2047;Type=2;ReadArbs=Arbitrate if Multiple Requestors Only;ElementsPerRead=1;WriteArbs=Arbitrate if Multiple Requestors Only;ElementsPerWrite=1;Implementation=2;Multi_Channel;DataType=100080000000000100094008000355363400010000000000000000000000000000;DisableOnOverflowUnderflow=FALSE"PFI 0 Rd DataNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module/SignalList/PFI 0 Rd Data;0;ReadMethodType=boolPFI 0 WEArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 0 WE;0;WriteMethodType=boolPFI 0 Wr DataArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 0 Wr Data;0;WriteMethodType=boolPFI 1 Rd DataNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module/SignalList/PFI 1 Rd Data;0;ReadMethodType=boolPFI 1 WEArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 1 WE;0;WriteMethodType=boolPFI 1 Wr DataArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 1 Wr Data;0;WriteMethodType=boolPFI 2 Rd DataNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module/SignalList/PFI 2 Rd Data;0;ReadMethodType=boolPFI 2 WEArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 2 WE;0;WriteMethodType=boolPFI 2 Wr DataArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 2 Wr Data;0;WriteMethodType=boolPFI 3 Rd DataNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module/SignalList/PFI 3 Rd Data;0;ReadMethodType=boolPFI 3 WEArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 3 WE;0;WriteMethodType=boolPFI 3 Wr DataArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 3 Wr Data;0;WriteMethodType=boolPLL LockedNumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/PLL Locked;0;ReadMethodType=boolPXIe-7961R/RioClk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSPXIE_7961RFPGA_TARGET_FAMILYVIRTEX5TARGET_TYPEFPGASample ClockResourceName=IO ModuleA_ASample Clock;TopSignalConnect=IO_ModuleA_ASampleClkLv;ClockSignalName=IO_ModuleA_ASampleClkLv;MinFreq=80000000.000000;MaxFreq=80000000.000000;VariableFreq=0;NomFreq=80000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=45.000000;MaxDutyCycle=55.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;SPI AddressArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/SPI Address;0;WriteMethodType=U16SPI Device SelectArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/SPI Device Select;0;WriteMethodType=U8SPI IdleNumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/SPI Idle;0;ReadMethodType=boolSPI Read DataNumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/SPI Read Data;0;ReadMethodType=U8SPI ReadArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/SPI Read;0;WriteMethodType=boolSPI Write DataArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/SPI Write Data;0;WriteMethodType=U16SPI WriteArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/SPI Write;0;WriteMethodType=boolUser Command CommitArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/User Command Commit;0;WriteMethodType=boolUser Command IdleNumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/User Command Idle;0;ReadMethodType=boolUser Command StatusNumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/User Command Status;0;ReadMethodType=U8User CommandArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/User Command;0;WriteMethodType=U8User Data 0ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/User Data 0;0;WriteMethodType=U8User Data 1ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/User Data 1;0;WriteMethodType=U8User ErrorNumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/User Error;0;ReadMethodType=U8User ReturnNumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/User Return;0;ReadMethodType=U16</Property>
			<Property Name="NI.FPGA.79XXR.ConfiguredIOModule" Type="Str">IOModuleID:0x10937576,Version:15.1.0,National Instruments::NI 5732,SyncClock:CLK10</Property>
			<Property Name="NI.LV.FPGA.CLIPDeclarations[0].Category" Type="Str">FlexRIO-IOModule</Property>
			<Property Name="NI.LV.FPGA.CLIPDeclarations[0].InvalidPath" Type="Str"></Property>
			<Property Name="NI.LV.FPGA.CLIPDeclarations[0].Name" Type="Str">NI 5732</Property>
			<Property Name="NI.LV.FPGA.CLIPDeclarationsArraySize" Type="Int">1</Property>
			<Property Name="NI.LV.FPGA.CLIPDeclarationSet" Type="Xml">
<CLIPDeclarationSet>
   <CLIPDeclarationCategory name="FlexRIO-IOModule">
      <CLIPDeclaration name="NI 5732">
         <CLIPVersion>15.1.0</CLIPVersion>
         <CompatibleCLIPSocketList>
            <Socket>FlexRIO-IOModule</Socket>
         </CompatibleCLIPSocketList>
         <CompatibleIOModuleList>
            <IOModule>IOModuleID:0x10937576</IOModule>
         </CompatibleIOModuleList>
         <DeclarationPaths>
            <Absolute>C:\Program Files (x86)\National Instruments\Shared\FlexRIO\IO Modules\NI 5732\15.1.0\V5\NI5732\LvFpgaTarget\Ni5732.xml</Absolute>
            <MD5>26d873eb92e838e923e5b8196b799282</MD5>
            <RelativeToLabVIEW>..\Shared\FlexRIO\IO Modules\NI 5732\15.1.0\V5\NI5732\LvFpgaTarget\Ni5732.xml</RelativeToLabVIEW>
            <RelativeToNiPubDocs>..\..\..\..\Program Files (x86)\National Instruments\Shared\FlexRIO\IO Modules\NI 5732\15.1.0\V5\NI5732\LvFpgaTarget\Ni5732.xml</RelativeToNiPubDocs>
            <RelativeToNiSharedDir>Shared\FlexRIO\IO Modules\NI 5732\15.1.0\V5\NI5732\LvFpgaTarget\Ni5732.xml</RelativeToNiSharedDir>
            <RelativeToProject>..\..\..\..\..\Program Files (x86)\National Instruments\Shared\FlexRIO\IO Modules\NI 5732\15.1.0\V5\NI5732\LvFpgaTarget\Ni5732.xml</RelativeToProject>
            <Valid>true</Valid>
         </DeclarationPaths>
         <Description>This CLIP provides access to two analog input channels, eight bidirectional DIO channels, four bidirectional PFI channels, and an input clock selector (Internal Sample clock, Internal Sample clock locked to an external Reference clock through the CLK IN connector, External Sample clock through the CLK IN connector, or Internal Sample clock locked to an external Reference clock through Sync Clock).

    This CLIP also contains an engine to program the ADC and clock, either through predetermined settings for an easier instrument setup or through raw SPI address and data signals for a more advanced setup. In the LabVIEW FPGA Module, 14-bit analog input data is accessed using a U16 data type (left justified). Each PFI channel is accessed using a Boolean signal and each DIO signal is accessed using a U8 data type.</Description>
         <FormatVersion>4.3</FormatVersion>
         <ImplementationList>
            <Path name="..\Target\xilinx\GatewayTop.ngc">
               <SimulationFileList>
                  <SimulationModelType>Exclude from simulation model</SimulationModelType>
               </SimulationFileList>
            </Path>
            <Path name="..\..\..\CommonFiles\Source\vhdl\GatewayBase.vhd">
               <SimulationFileList>
                  <SimulationModelType>Exclude from simulation model</SimulationModelType>
               </SimulationFileList>
            </Path>
            <Path name="..\..\..\CommonFiles\Source\vhdl\SafeBufgce.vhd">
               <SimulationFileList>
                  <SimulationModelType>Exclude from simulation model</SimulationModelType>
               </SimulationFileList>
            </Path>
            <Path name="..\Source\vhdl\Ni5732.vhd">
               <SimulationFileList>
                  <SimulationModelType>Exclude from simulation model</SimulationModelType>
               </SimulationFileList>
               <TopLevel></TopLevel>
            </Path>
            <Path name="..\Source\vhdl\GatewayBaseAd9258.vhd">
               <SimulationFileList>
                  <SimulationModelType>Exclude from simulation model</SimulationModelType>
               </SimulationFileList>
            </Path>
            <Path name="..\Target\Ni5732.ucf">
               <SimulationFileList>
                  <SimulationModelType>Exclude from simulation model</SimulationModelType>
               </SimulationFileList>
            </Path>
            <VerifiedImplementationList>
               <Path name="C:\Program Files (x86)\National Instruments\Shared\FlexRIO\IO Modules\NI 5732\15.1.0\V5\NI5732\Source\vhdl\Ni5732.vhd">
                  <MD5>8946924f69a7a4d28d421e1971d5b5bd</MD5>
                  <SimulationFileList>
                     <SimulationModelType>Exclude from simulation model</SimulationModelType>
                  </SimulationFileList>
                  <TopLevel></TopLevel>
               </Path>
               <Path name="C:\Program Files (x86)\National Instruments\Shared\FlexRIO\IO Modules\NI 5732\15.1.0\V5\NI5732\Target\xilinx\GatewayTop.ngc">
                  <MD5>c95cccd3f4a62e414596cffa39b3701a</MD5>
                  <SimulationFileList>
                     <SimulationModelType>Exclude from simulation model</SimulationModelType>
                  </SimulationFileList>
               </Path>
               <Path name="C:\Program Files (x86)\National Instruments\Shared\FlexRIO\IO Modules\NI 5732\15.1.0\CommonFiles\Source\vhdl\GatewayBase.vhd">
                  <MD5>70980ef6da90a5d808ef44eb222fccd5</MD5>
                  <SimulationFileList>
                     <SimulationModelType>Exclude from simulation model</SimulationModelType>
                  </SimulationFileList>
               </Path>
               <Path name="C:\Program Files (x86)\National Instruments\Shared\FlexRIO\IO Modules\NI 5732\15.1.0\CommonFiles\Source\vhdl\SafeBufgce.vhd">
                  <MD5>6163cd1f9189ed3770c0bb9fca4fea80</MD5>
                  <SimulationFileList>
                     <SimulationModelType>Exclude from simulation model</SimulationModelType>
                  </SimulationFileList>
               </Path>
               <Path name="C:\Program Files (x86)\National Instruments\Shared\FlexRIO\IO Modules\NI 5732\15.1.0\V5\NI5732\Source\vhdl\GatewayBaseAd9258.vhd">
                  <MD5>914cf2a79dfd4b33c486ed91c079ba20</MD5>
                  <SimulationFileList>
                     <SimulationModelType>Exclude from simulation model</SimulationModelType>
                  </SimulationFileList>
               </Path>
               <Path name="C:\Program Files (x86)\National Instruments\Shared\FlexRIO\IO Modules\NI 5732\15.1.0\V5\NI5732\Target\Ni5732.ucf">
                  <MD5>4a62159fea15e1e022e16deffac8f082</MD5>
                  <SimulationFileList>
                     <SimulationModelType>Exclude from simulation model</SimulationModelType>
                  </SimulationFileList>
               </Path>
            </VerifiedImplementationList>
         </ImplementationList>
         <InterfaceList>
            <Interface name="Socket">
               <InterfaceType>Socket</InterfaceType>
               <SignalList>
                  <Signal name="aUserGpio">
                     <DataType>
                        <Array>
                           <Boolean></Boolean>
                           <Size>66</Size>
                        </Array>
                     </DataType>
                     <Description></Description>
                     <Direction>Bidirectional</Direction>
                     <HDLName>aUserGpio</HDLName>
                     <HDLType>std_logic_vector(65 downto 0)</HDLType>
                     <RequiredClockDomain></RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>NotAllowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="aUserGpio_n">
                     <DataType>
                        <Array>
                           <Boolean></Boolean>
                           <Size>66</Size>
                        </Array>
                     </DataType>
                     <Description></Description>
                     <Direction>Bidirectional</Direction>
                     <HDLName>aUserGpio_n</HDLName>
                     <HDLType>std_logic_vector(65 downto 0)</HDLType>
                     <RequiredClockDomain></RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>NotAllowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="UserGClkLvds">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>UserGClkLvds</HDLName>
                     <HDLType>std_logic</HDLType>
                     <RequiredClockDomain></RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>NotAllowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="UserGClkLvds_n">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>UserGClkLvds_n</HDLName>
                     <HDLType>std_logic</HDLType>
                     <RequiredClockDomain></RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>NotAllowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="UserGClkLvttl">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>UserGClkLvttl</HDLName>
                     <HDLType>std_logic</HDLType>
                     <RequiredClockDomain></RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>NotAllowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="rIoModGpioEn">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>rIoModGpioEn</HDLName>
                     <HDLType>std_logic</HDLType>
                     <RequiredClockDomain></RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>NotAllowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="rClkToSocket">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>rClkToSocket</HDLName>
                     <HDLType>std_logic</HDLType>
                     <RequiredClockDomain></RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>NotAllowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="rLvFpgaReqI2cBus">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>FromCLIP</Direction>
                     <HDLName>rLvFpgaReqI2cBus</HDLName>
                     <HDLType>std_logic</HDLType>
                     <RequiredClockDomain></RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>NotAllowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="rLvFpgaAckI2cBus">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>rLvFpgaAckI2cBus</HDLName>
                     <HDLType>std_logic</HDLType>
                     <RequiredClockDomain></RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>NotAllowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="rLvFpgaI2cGo">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>FromCLIP</Direction>
                     <HDLName>rLvFpgaI2cGo</HDLName>
                     <HDLType>std_logic</HDLType>
                     <RequiredClockDomain></RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>NotAllowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="rLvFpgaI2cStart">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>FromCLIP</Direction>
                     <HDLName>rLvFpgaI2cStart</HDLName>
                     <HDLType>std_logic</HDLType>
                     <RequiredClockDomain></RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>NotAllowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="rLvFpgaI2cStop">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>FromCLIP</Direction>
                     <HDLName>rLvFpgaI2cStop</HDLName>
                     <HDLType>std_logic</HDLType>
                     <RequiredClockDomain></RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>NotAllowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="rLvFpgaI2cRd">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>FromCLIP</Direction>
                     <HDLName>rLvFpgaI2cRd</HDLName>
                     <HDLType>std_logic</HDLType>
                     <RequiredClockDomain></RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>NotAllowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="rLvFpgaI2cWtData">
                     <DataType>
                        <Array>
                           <Boolean></Boolean>
                           <Size>8</Size>
                        </Array>
                     </DataType>
                     <Description></Description>
                     <Direction>FromCLIP</Direction>
                     <HDLName>rLvFpgaI2cWtData</HDLName>
                     <HDLType>std_logic_vector(7 downto 0)</HDLType>
                     <RequiredClockDomain></RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>NotAllowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="rLvFpgaI2cAck">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>rLvFpgaI2cAck</HDLName>
                     <HDLType>std_logic</HDLType>
                     <RequiredClockDomain></RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>NotAllowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="rLvFpgaI2cDone">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>rLvFpgaI2cDone</HDLName>
                     <HDLType>std_logic</HDLType>
                     <RequiredClockDomain></RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>NotAllowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="rLvFpgaI2cRdData">
                     <DataType>
                        <Array>
                           <Boolean></Boolean>
                           <Size>8</Size>
                        </Array>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>rLvFpgaI2cRdData</HDLName>
                     <HDLType>std_logic_vector(7 downto 0)</HDLType>
                     <RequiredClockDomain></RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>NotAllowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="IoModClipClock0">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>FromCLIP</Direction>
                     <HDLName>IoModClipClock0</HDLName>
                     <HDLType>std_logic</HDLType>
                     <RequiredClockDomain></RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>NotAllowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="IoModClipClock1">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>FromCLIP</Direction>
                     <HDLName>IoModClipClock1</HDLName>
                     <HDLType>std_logic</HDLType>
                     <RequiredClockDomain></RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>NotAllowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
               </SignalList>
            </Interface>
            <Interface name="Fabric">
               <InterfaceType>Fabric</InterfaceType>
               <SignalList>
                  <Signal name="aReset">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>aReset</HDLName>
                     <HDLType>std_logic</HDLType>
                     <SignalType>reset</SignalType>
                  </Signal>
                  <Signal name="Clock Gate">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Direction>ToCLIP</Direction>
                     <HDLName>aClkGateLv</HDLName>
                     <HDLType>std_logic</HDLType>
                     <SignalType>clock gate</SignalType>
                  </Signal>
               </SignalList>
            </Interface>
            <Interface name="Ni5732">
               <InterfaceType>LabVIEW</InterfaceType>
               <SignalList>
                  <Signal name="Clock 40 MHz">
                     <AccuracyInPPM>100.000000</AccuracyInPPM>
                     <CyclesRequiredBeforeAsynchronousResetClears>0</CyclesRequiredBeforeAsynchronousResetClears>
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <DutyCycleRange>
                        <PercentInHighMax>55.000000</PercentInHighMax>
                        <PercentInHighMin>45.000000</PercentInHighMin>
                     </DutyCycleRange>
                     <FreqInHertz>
                        <Max>40M</Max>
                        <Min>40M</Min>
                     </FreqInHertz>
                     <HDLName>Clk40</HDLName>
                     <HDLType>std_logic</HDLType>
                     <JitterInPicoSeconds>250.000000</JitterInPicoSeconds>
                     <SignalType>clock</SignalType>
                  </Signal>
                  <Signal name="Sample Clock">
                     <AccuracyInPPM>100.000000</AccuracyInPPM>
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>FromCLIP</Direction>
                     <DutyCycleRange>
                        <PercentInHighMax>55.000000</PercentInHighMax>
                        <PercentInHighMin>45.000000</PercentInHighMin>
                     </DutyCycleRange>
                     <FreqInHertz>
                        <Max>80M</Max>
                        <Min>80M</Min>
                     </FreqInHertz>
                     <HDLName>SampleClkLv</HDLName>
                     <HDLType>std_logic</HDLType>
                     <JitterInPicoSeconds>250.000000</JitterInPicoSeconds>
                     <SignalType>clock</SignalType>
                     <SupportsGating></SupportsGating>
                  </Signal>
                  <Signal name="AI 0">
                     <DataType>
                        <U16></U16>
                     </DataType>
                     <Description></Description>
                     <Direction>FromCLIP</Direction>
                     <HDLName>sDataCh0</HDLName>
                     <HDLType>std_logic_vector(15 downto 0)</HDLType>
                     <RequiredClockDomain>Sample Clock</RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="AI 0 Over Range">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>FromCLIP</Direction>
                     <HDLName>sDataCh0OR</HDLName>
                     <HDLType>std_logic</HDLType>
                     <RequiredClockDomain>Sample Clock</RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="AI 1">
                     <DataType>
                        <U16></U16>
                     </DataType>
                     <Description></Description>
                     <Direction>FromCLIP</Direction>
                     <HDLName>sDataCh1</HDLName>
                     <HDLType>std_logic_vector(15 downto 0)</HDLType>
                     <RequiredClockDomain>Sample Clock</RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="AI 1 Over Range">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>FromCLIP</Direction>
                     <HDLName>sDataCh1OR</HDLName>
                     <HDLType>std_logic</HDLType>
                     <RequiredClockDomain>Sample Clock</RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="Initialization Done">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>FromCLIP</Direction>
                     <HDLName>cInitDone</HDLName>
                     <HDLType>std_logic</HDLType>
                     <RequiredClockDomain>Clock 40 MHz</RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="PLL Locked">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>FromCLIP</Direction>
                     <HDLName>cClockStatus</HDLName>
                     <HDLType>std_logic</HDLType>
                     <RequiredClockDomain>Clock 40 MHz</RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="DC Over Voltage">
                     <DataType>
                        <U8></U8>
                     </DataType>
                     <Description></Description>
                     <Direction>FromCLIP</Direction>
                     <HDLName>cDcOverVoltage</HDLName>
                     <HDLType>std_logic_vector(7 downto 0)</HDLType>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="User Command">
                     <DataType>
                        <U8></U8>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>cLvUserCmd</HDLName>
                     <HDLType>std_logic_vector(7 downto 0)</HDLType>
                     <RequiredClockDomain>Clock 40 MHz</RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="User Command Commit">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>cLvUserCmdGo</HDLName>
                     <HDLType>std_logic</HDLType>
                     <RequiredClockDomain>Clock 40 MHz</RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="User Command Idle">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>FromCLIP</Direction>
                     <HDLName>cLvUserCmdIdle</HDLName>
                     <HDLType>std_logic</HDLType>
                     <RequiredClockDomain>Clock 40 MHz</RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="User Data 0">
                     <DataType>
                        <U8></U8>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>cLvUserData0</HDLName>
                     <HDLType>std_logic_vector(7 downto 0)</HDLType>
                     <RequiredClockDomain>Clock 40 MHz</RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="User Data 1">
                     <DataType>
                        <U8></U8>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>cLvUserData1</HDLName>
                     <HDLType>std_logic_vector(7 downto 0)</HDLType>
                     <RequiredClockDomain>Clock 40 MHz</RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="User Command Status">
                     <DataType>
                        <U8></U8>
                     </DataType>
                     <Description></Description>
                     <Direction>FromCLIP</Direction>
                     <HDLName>cLvUserCmdStatus</HDLName>
                     <HDLType>std_logic_vector(7 downto 0)</HDLType>
                     <RequiredClockDomain>Clock 40 MHz</RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="User Return">
                     <DataType>
                        <U16></U16>
                     </DataType>
                     <Description></Description>
                     <Direction>FromCLIP</Direction>
                     <HDLName>cLvUserReturn</HDLName>
                     <HDLType>std_logic_vector(15 downto 0)</HDLType>
                     <RequiredClockDomain>Clock 40 MHz</RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="User Error">
                     <DataType>
                        <U8></U8>
                     </DataType>
                     <Description></Description>
                     <Direction>FromCLIP</Direction>
                     <HDLName>cLvUserError</HDLName>
                     <HDLType>std_logic_vector(7 downto 0)</HDLType>
                     <RequiredClockDomain>Clock 40 MHz</RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="DIO Port 0 Rd Data">
                     <DataType>
                        <U8></U8>
                     </DataType>
                     <Description></Description>
                     <Direction>FromCLIP</Direction>
                     <HDLName>aDioPort0Rd</HDLName>
                     <HDLType>std_logic_vector(7 downto 0)</HDLType>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="DIO Port 0 Wr Data">
                     <DataType>
                        <U8></U8>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>aDioPort0Wr</HDLName>
                     <HDLType>std_logic_vector(7 downto 0)</HDLType>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="DIO Port 0 WE">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>aDioPort0We</HDLName>
                     <HDLType>std_logic</HDLType>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="DIO Port 1 Rd Data">
                     <DataType>
                        <U8></U8>
                     </DataType>
                     <Description></Description>
                     <Direction>FromCLIP</Direction>
                     <HDLName>aDioPort1Rd</HDLName>
                     <HDLType>std_logic_vector(7 downto 0)</HDLType>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="DIO Port 1 Wr Data">
                     <DataType>
                        <U8></U8>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>aDioPort1Wr</HDLName>
                     <HDLType>std_logic_vector(7 downto 0)</HDLType>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="DIO Port 1 WE">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>aDioPort1We</HDLName>
                     <HDLType>std_logic</HDLType>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="PFI 0 Rd Data">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>FromCLIP</Direction>
                     <HDLName>aPfi0Rd</HDLName>
                     <HDLType>std_logic</HDLType>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="PFI 0 Wr Data">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>aPfi0Wr</HDLName>
                     <HDLType>std_logic</HDLType>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="PFI 0 WE">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>aPfi0We</HDLName>
                     <HDLType>std_logic</HDLType>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="PFI 1 Rd Data">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>FromCLIP</Direction>
                     <HDLName>aPfi1Rd</HDLName>
                     <HDLType>std_logic</HDLType>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="PFI 1 Wr Data">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>aPfi1Wr</HDLName>
                     <HDLType>std_logic</HDLType>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="PFI 1 WE">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>aPfi1We</HDLName>
                     <HDLType>std_logic</HDLType>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="PFI 2 Rd Data">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>FromCLIP</Direction>
                     <HDLName>aPfi2Rd</HDLName>
                     <HDLType>std_logic</HDLType>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="PFI 2 Wr Data">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>aPfi2Wr</HDLName>
                     <HDLType>std_logic</HDLType>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="PFI 2 WE">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>aPfi2We</HDLName>
                     <HDLType>std_logic</HDLType>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="PFI 3 Rd Data">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>FromCLIP</Direction>
                     <HDLName>aPfi3Rd</HDLName>
                     <HDLType>std_logic</HDLType>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="PFI 3 Wr Data">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>aPfi3Wr</HDLName>
                     <HDLType>std_logic</HDLType>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="PFI 3 WE">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>aPfi3We</HDLName>
                     <HDLType>std_logic</HDLType>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="SPI Idle">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>FromCLIP</Direction>
                     <HDLName>cLvSpiIdle</HDLName>
                     <HDLType>std_logic</HDLType>
                     <RequiredClockDomain>Clock 40 MHz</RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="SPI Device Select">
                     <DataType>
                        <U8></U8>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>cLvSpiDevice</HDLName>
                     <HDLType>std_logic_vector(7 downto 0)</HDLType>
                     <RequiredClockDomain>Clock 40 MHz</RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="SPI Address">
                     <DataType>
                        <U16></U16>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>cLvSpiAddr</HDLName>
                     <HDLType>std_logic_vector(15 downto 0)</HDLType>
                     <RequiredClockDomain>Clock 40 MHz</RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="SPI Read Data">
                     <DataType>
                        <U8></U8>
                     </DataType>
                     <Description></Description>
                     <Direction>FromCLIP</Direction>
                     <HDLName>cLvSpiRdData</HDLName>
                     <HDLType>std_logic_vector(7 downto 0)</HDLType>
                     <RequiredClockDomain>Clock 40 MHz</RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="SPI Read">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>cLvSpiRdEn</HDLName>
                     <HDLType>std_logic</HDLType>
                     <RequiredClockDomain>Clock 40 MHz</RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="SPI Write Data">
                     <DataType>
                        <U16></U16>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>cLvSpiWrData</HDLName>
                     <HDLType>std_logic_vector(15 downto 0)</HDLType>
                     <RequiredClockDomain>Clock 40 MHz</RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
                  <Signal name="SPI Write">
                     <DataType>
                        <Boolean></Boolean>
                     </DataType>
                     <Description></Description>
                     <Direction>ToCLIP</Direction>
                     <HDLName>cLvSpiWrEn</HDLName>
                     <HDLType>std_logic</HDLType>
                     <RequiredClockDomain>Clock 40 MHz</RequiredClockDomain>
                     <SignalType>data</SignalType>
                     <UseInLabVIEWSingleCycleTimedLoop>Allowed</UseInLabVIEWSingleCycleTimedLoop>
                  </Signal>
               </SignalList>
            </Interface>
         </InterfaceList>
         <NumberOfBufGsNeeded>2</NumberOfBufGsNeeded>
         <NumberOfDCMsNeeded>0</NumberOfDCMsNeeded>
         <NumberOfMMCMsNeeded>0</NumberOfMMCMsNeeded>
         <SupportedDeviceFamilies>Virtex-5</SupportedDeviceFamilies>
         <TopLevelEntityAndArchitecture>
            <SynthesisModel>
               <Architecture>rtl</Architecture>
               <Entity>Ni5732</Entity>
            </SynthesisModel>
         </TopLevelEntityAndArchitecture>
      </CLIPDeclaration>
   </CLIPDeclarationCategory>
</CLIPDeclarationSet></Property>
			<Property Name="NI.LV.FPGA.CompileConfigString" Type="Str">PXIe-7961R/RioClk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSPXIE_7961RFPGA_TARGET_FAMILYVIRTEX5TARGET_TYPEFPGA</Property>
			<Property Name="NI.LV.FPGA.Version" Type="Int">6</Property>
			<Property Name="Resource Name" Type="Str">RIO0</Property>
			<Property Name="Target Class" Type="Str">PXIe-7961R</Property>
			<Property Name="Top-Level Timing Source" Type="Str">40 MHz Onboard Clock</Property>
			<Property Name="Top-Level Timing Source Is Default" Type="Bool">true</Property>
			<Item Name="SubVIs" Type="Folder"/>
			<Item Name="IO Module" Type="FPGA Component Level IP">
				<Property Name="FPGA.PersistentID" Type="Str">{0C51A0EB-6AE3-4F19-B408-CEDB75C2C1F7}</Property>
				<Property Name="NI.FPGA.79XXR.NormalizeCLIPPath" Type="Str">true</Property>
				<Property Name="NI.LV.CLIP.ClockConnections" Type="Xml">
<CLIPConnections>
   <CLIPSignal name="Clock 40 MHz">
      <ClockFromCLIP>false</ClockFromCLIP>
      <Direction>ToCLIP</Direction>
      <HDLName>Clk40</HDLName>
      <LinkToFPGAClock>40 MHz Onboard Clock</LinkToFPGAClock>
      <MaxFreq>40000000.00000</MaxFreq>
      <MinFreq>40000000.00000</MinFreq>
      <UseTopClock>false</UseTopClock>
   </CLIPSignal>
   <CLIPSignal name="Sample Clock">
      <ClockFromCLIP>true</ClockFromCLIP>
      <Direction>FromCLIP</Direction>
      <HDLName>SampleClkLv</HDLName>
      <LinkToFPGAClock></LinkToFPGAClock>
      <MaxFreq>80000000.00000</MaxFreq>
      <MinFreq>80000000.00000</MinFreq>
      <UseTopClock>false</UseTopClock>
   </CLIPSignal>
</CLIPConnections></Property>
				<Property Name="NI.LV.CLIP.DeclarationCategory" Type="Str">FlexRIO-IOModule</Property>
				<Property Name="NI.LV.CLIP.DeclarationName" Type="Str">NI 5732</Property>
				<Property Name="NI.LV.CLIP.ExtendedConfigString" Type="Str">IOModuleID:0x10937576,Version:15.1.0,National Instruments::NI 5732,SyncClock:CLK10</Property>
				<Property Name="NI.LV.CLIP.SocketedCLIP" Type="Bool">true</Property>
				<Property Name="NI.LV.CLIP.SocketSelection" Type="Str">FlexRIO-IOModule</Property>
				<Property Name="NI.LV.CLIP.SocketSpecificCompileSignature" Type="Str">431934833ad3e9a7c9cad4e7878a3e65IOModuleID:0x10937576,Version:15.1.0,National Instruments::NI 5732,SyncClock:CLK10</Property>
				<Property Name="NI.LV.CLIP.Version" Type="UInt">4</Property>
				<Property Name="NI.LV.FPGA.CompileConfigString" Type="Str">431934833ad3e9a7c9cad4e7878a3e65IOModuleID:0x10937576,Version:15.1.0,National Instruments::NI 5732,SyncClock:CLK1026d873eb92e838e923e5b8196b7992824a62159fea15e1e022e16deffac8f0826163cd1f9189ed3770c0bb9fca4fea8070980ef6da90a5d808ef44eb222fccd58946924f69a7a4d28d421e1971d5b5bd914cf2a79dfd4b33c486ed91c079ba20c95cccd3f4a62e414596cffa39b3701a&lt;Array&gt;
&lt;Name&gt;Generics&lt;/Name&gt;
&lt;Dimsize&gt;0&lt;/Dimsize&gt;
&lt;Cluster&gt;
&lt;Name&gt;CLIP Generic&lt;/Name&gt;
&lt;NumElts&gt;5&lt;/NumElts&gt;
&lt;String&gt;
&lt;Name&gt;Name&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;Type&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;Default value&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;Value&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;Description&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;/Cluster&gt;
&lt;/Array&gt;
&lt;Array&gt;
&lt;Name&gt;Clock Connections&lt;/Name&gt;
&lt;Dimsize&gt;2&lt;/Dimsize&gt;
&lt;Cluster&gt;
&lt;Name&gt;CLIP Clock Connection&lt;/Name&gt;
&lt;NumElts&gt;2&lt;/NumElts&gt;
&lt;Cluster&gt;
&lt;Name&gt;CLIP Clock&lt;/Name&gt;
&lt;NumElts&gt;6&lt;/NumElts&gt;
&lt;String&gt;
&lt;Name&gt;LabVIEW name&lt;/Name&gt;
&lt;Val&gt;Clock 40 MHz&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;VHDL name&lt;/Name&gt;
&lt;Val&gt;Clk40&lt;/Val&gt;
&lt;/String&gt;
&lt;DBL&gt;
&lt;Name&gt;Max Freq&lt;/Name&gt;
&lt;Val&gt;40000000.00000000000000&lt;/Val&gt;
&lt;/DBL&gt;
&lt;DBL&gt;
&lt;Name&gt;Min Freq&lt;/Name&gt;
&lt;Val&gt;40000000.00000000000000&lt;/Val&gt;
&lt;/DBL&gt;
&lt;EW&gt;
&lt;Name&gt;Direction&lt;/Name&gt;
&lt;Choice&gt;ToCLIP&lt;/Choice&gt;
&lt;Choice&gt;FromCLIP&lt;/Choice&gt;
&lt;Choice&gt;Bidirectional&lt;/Choice&gt;
&lt;Val&gt;0&lt;/Val&gt;
&lt;/EW&gt;
&lt;String&gt;
&lt;Name&gt;ClockToLinkTo&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;/Cluster&gt;
&lt;Cluster&gt;
&lt;Name&gt;FPGA Clock&lt;/Name&gt;
&lt;NumElts&gt;3&lt;/NumElts&gt;
&lt;String&gt;
&lt;Name&gt;Name&lt;/Name&gt;
&lt;Val&gt;40 MHz Onboard Clock&lt;/Val&gt;
&lt;/String&gt;
&lt;Boolean&gt;
&lt;Name&gt;Use Top Clock&lt;/Name&gt;
&lt;Val&gt;0&lt;/Val&gt;
&lt;/Boolean&gt;
&lt;Boolean&gt;
&lt;Name&gt;Clock From CLIP&lt;/Name&gt;
&lt;Val&gt;0&lt;/Val&gt;
&lt;/Boolean&gt;
&lt;/Cluster&gt;
&lt;/Cluster&gt;
&lt;Cluster&gt;
&lt;Name&gt;CLIP Clock Connection&lt;/Name&gt;
&lt;NumElts&gt;2&lt;/NumElts&gt;
&lt;Cluster&gt;
&lt;Name&gt;CLIP Clock&lt;/Name&gt;
&lt;NumElts&gt;6&lt;/NumElts&gt;
&lt;String&gt;
&lt;Name&gt;LabVIEW name&lt;/Name&gt;
&lt;Val&gt;Sample Clock&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;VHDL name&lt;/Name&gt;
&lt;Val&gt;SampleClkLv&lt;/Val&gt;
&lt;/String&gt;
&lt;DBL&gt;
&lt;Name&gt;Max Freq&lt;/Name&gt;
&lt;Val&gt;80000000.00000000000000&lt;/Val&gt;
&lt;/DBL&gt;
&lt;DBL&gt;
&lt;Name&gt;Min Freq&lt;/Name&gt;
&lt;Val&gt;80000000.00000000000000&lt;/Val&gt;
&lt;/DBL&gt;
&lt;EW&gt;
&lt;Name&gt;Direction&lt;/Name&gt;
&lt;Choice&gt;ToCLIP&lt;/Choice&gt;
&lt;Choice&gt;FromCLIP&lt;/Choice&gt;
&lt;Choice&gt;Bidirectional&lt;/Choice&gt;
&lt;Val&gt;1&lt;/Val&gt;
&lt;/EW&gt;
&lt;String&gt;
&lt;Name&gt;ClockToLinkTo&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;/Cluster&gt;
&lt;Cluster&gt;
&lt;Name&gt;FPGA Clock&lt;/Name&gt;
&lt;NumElts&gt;3&lt;/NumElts&gt;
&lt;String&gt;
&lt;Name&gt;Name&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;Boolean&gt;
&lt;Name&gt;Use Top Clock&lt;/Name&gt;
&lt;Val&gt;0&lt;/Val&gt;
&lt;/Boolean&gt;
&lt;Boolean&gt;
&lt;Name&gt;Clock From CLIP&lt;/Name&gt;
&lt;Val&gt;1&lt;/Val&gt;
&lt;/Boolean&gt;
&lt;/Cluster&gt;
&lt;/Cluster&gt;
&lt;/Array&gt;
</Property>
				<Property Name="NI.LV.FPGA.Valid" Type="Bool">true</Property>
				<Property Name="NI.SortType" Type="Int">3</Property>
				<Item Name="AI 0" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>0</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/AI 0</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{5F045765-DADE-499E-A676-AFEB6C692253}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="AI 0 Over Range" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>0</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/AI 0 Over Range</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{7D40381A-49EB-4928-AB5F-DE552D6AC27B}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="AI 1" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>0</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/AI 1</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{E9719A58-2C34-4830-8A8A-34685291A794}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="AI 1 Over Range" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>0</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/AI 1 Over Range</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{1FD8C95B-A53D-4698-9B87-420D27CF72D2}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="Initialization Done" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>0</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/Initialization Done</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{173AB736-AE6E-4D32-AD2E-3443228EAA17}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="PLL Locked" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>0</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/PLL Locked</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{8AAA250B-A288-4BFA-8C93-E9A3C5CBCF6D}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="DC Over Voltage" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/DC Over Voltage</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{AF381BBF-4993-43D8-B0E9-0428AD000BBA}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="User Command" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>0</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/User Command</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{42645120-A796-4392-83CA-BDB7DACDF525}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="User Command Commit" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>0</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/User Command Commit</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{D7A7BA27-EDE6-490F-A916-B4420F31577A}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="User Command Idle" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>0</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/User Command Idle</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{86A88140-24E3-4B23-8D6B-D827DAA43C83}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="User Data 0" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>0</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/User Data 0</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{CAF62FF4-FA07-4702-B99B-34C0CA520998}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="User Data 1" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>0</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/User Data 1</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{D0EECF58-116D-4BCA-A88C-C1982A588587}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="User Command Status" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>0</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/User Command Status</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{1BE802ED-283C-4B7D-A841-E29879259579}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="User Return" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>0</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/User Return</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{50107835-FCDF-4764-8C9C-3F3C511A2A37}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="User Error" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>0</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/User Error</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{E0E357A2-C6FC-41EE-9325-6D169DB7FD56}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="DIO Port 0 Rd Data" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/DIO Port 0 Rd Data</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{96B502D3-977B-4EC4-9D1A-5CB5BDE98728}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="DIO Port 0 Wr Data" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>1</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/DIO Port 0 Wr Data</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{F95181D5-02F3-410C-A733-D9EDC797479C}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="DIO Port 0 WE" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>1</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/DIO Port 0 WE</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{4D615A83-5944-43C2-A7D0-0DFCE5FC8BFA}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="DIO Port 1 Rd Data" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/DIO Port 1 Rd Data</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{6CBCB05E-9479-4A6A-B7FB-CD8A02E47981}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="DIO Port 1 Wr Data" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>1</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/DIO Port 1 Wr Data</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{55BD4204-0920-4BB4-9591-38490A073A9F}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="DIO Port 1 WE" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>1</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/DIO Port 1 WE</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{24FA93DA-AEE7-43B6-894F-570BD7679526}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="PFI 0 Rd Data" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/PFI 0 Rd Data</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{D5EEEA61-5986-4026-807B-F63EF7CEBD4D}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="PFI 0 Wr Data" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>1</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/PFI 0 Wr Data</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{5150FCD7-5489-4EB3-BCFC-5B5012EC1024}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="PFI 0 WE" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>1</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/PFI 0 WE</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{1E986F3F-F9DF-416A-9ACA-F27636BF6918}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="PFI 1 Rd Data" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/PFI 1 Rd Data</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{AECEF0D8-40CE-420C-875C-E224C40F2484}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="PFI 1 Wr Data" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>1</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/PFI 1 Wr Data</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{93EF48FB-5C5F-4E58-9E8A-2899BCC9C55D}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="PFI 1 WE" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>1</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/PFI 1 WE</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{084485A6-14B5-43D5-91C0-349F095C9CC9}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="PFI 2 Rd Data" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/PFI 2 Rd Data</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{E1DA2EBB-BC77-4751-A50E-EB738230123E}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="PFI 2 Wr Data" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>1</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/PFI 2 Wr Data</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{0C087041-C96F-4ACB-B715-30E78FCCF938}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="PFI 2 WE" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>1</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/PFI 2 WE</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{A1C94580-E034-4216-BBDD-0447D0B17A78}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="PFI 3 Rd Data" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/PFI 3 Rd Data</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{7944625B-5AB7-4CEA-AE15-DB0B42013669}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="PFI 3 Wr Data" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>1</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/PFI 3 Wr Data</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{5F5BEDA4-29B2-48B2-AE74-775727823EC7}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="PFI 3 WE" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>1</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/PFI 3 WE</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{023AA419-BDF7-4384-B70B-94BC2612DBC2}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="SPI Idle" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>0</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/SPI Idle</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{F5535155-E68B-48FC-856D-DA1461543EE4}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="SPI Device Select" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>0</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/SPI Device Select</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{5579BF21-F618-44AA-BAB7-9D659DDD842B}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="SPI Address" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>0</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/SPI Address</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{B8D6A9FC-ABB8-4F87-8389-C1F57D096653}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="SPI Read Data" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>0</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/SPI Read Data</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{4F3E3145-2F6A-4A7B-9FEC-518BDFD95F6E}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="SPI Read" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>0</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/SPI Read</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{D299B906-FD79-444D-A645-DF4E0711E0F6}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="SPI Write Data" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>0</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/SPI Write Data</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{A82CC67A-BAC3-47D0-B287-7AB4853BD223}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="SPI Write" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>0</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module/SignalList/SPI Write</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{CC93FEC2-2EAD-4228-9A82-4FE45693F4BC}</Property>
					<Property Name="NI.LV.EIO.Physical" Type="Bool">true</Property>
				</Item>
				<Item Name="Sample Clock" Type="FPGA Component Level IP Clock">
					<Property Name="FPGA.PersistentID" Type="Str">{3EC811B6-E363-4FC2-A6C0-78C90C6AA66D}</Property>
					<Property Name="NI.LV.ClipClock.ExtendedName" Type="Str">IO Module/Sample Clock</Property>
					<Property Name="NI.LV.ClipClock.UsersVhdlClockName" Type="Str">Sample Clock</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig" Type="Str">ResourceName=IO ModuleA_ASample Clock;TopSignalConnect=IO_ModuleA_ASampleClkLv;ClockSignalName=IO_ModuleA_ASampleClkLv;MinFreq=80000000.000000;MaxFreq=80000000.000000;VariableFreq=0;NomFreq=80000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=45.000000;MaxDutyCycle=55.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.Accuracy" Type="Dbl">100</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.ClockSignalName" Type="Str">IO_ModuleA_ASampleClkLv</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.MaxDutyCycle" Type="Dbl">55</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.MaxFrequency" Type="Dbl">80000000</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.MinDutyCycle" Type="Dbl">45</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.MinFrequency" Type="Dbl">80000000</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.NominalFrequency" Type="Dbl">80000000</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.PeakPeriodJitter" Type="Dbl">250</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.ResourceName" Type="Str">IO ModuleA_ASample Clock</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.SupportAndRequireRuntimeEnableDisable" Type="Bool">false</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.TopSignalConnect" Type="Str">IO_ModuleA_ASampleClkLv</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.VariableFrequency" Type="Bool">false</Property>
					<Property Name="NI.LV.FPGA.Valid" Type="Bool">true</Property>
					<Property Name="NI.LV.FPGA.Version" Type="Int">5</Property>
				</Item>
			</Item>
			<Item Name="40 MHz Onboard Clock" Type="FPGA Base Clock">
				<Property Name="FPGA.PersistentID" Type="Str">{7ACD5512-AA81-4C36-8F48-546E508E9F31}</Property>
				<Property Name="NI.LV.FPGA.BaseTSConfig" Type="Str">ResourceName=40 MHz Onboard Clock;TopSignalConnect=RioClk40;ClockSignalName=RioClk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;</Property>
				<Property Name="NI.LV.FPGA.BaseTSConfig.Accuracy" Type="Dbl">100</Property>
				<Property Name="NI.LV.FPGA.BaseTSConfig.ClockSignalName" Type="Str">RioClk40</Property>
				<Property Name="NI.LV.FPGA.BaseTSConfig.MaxDutyCycle" Type="Dbl">50</Property>
				<Property Name="NI.LV.FPGA.BaseTSConfig.MaxFrequency" Type="Dbl">40000000</Property>
				<Property Name="NI.LV.FPGA.BaseTSConfig.MinDutyCycle" Type="Dbl">50</Property>
				<Property Name="NI.LV.FPGA.BaseTSConfig.MinFrequency" Type="Dbl">40000000</Property>
				<Property Name="NI.LV.FPGA.BaseTSConfig.NominalFrequency" Type="Dbl">40000000</Property>
				<Property Name="NI.LV.FPGA.BaseTSConfig.PeakPeriodJitter" Type="Dbl">250</Property>
				<Property Name="NI.LV.FPGA.BaseTSConfig.ResourceName" Type="Str">40 MHz Onboard Clock</Property>
				<Property Name="NI.LV.FPGA.BaseTSConfig.SupportAndRequireRuntimeEnableDisable" Type="Bool">false</Property>
				<Property Name="NI.LV.FPGA.BaseTSConfig.TopSignalConnect" Type="Str">RioClk40</Property>
				<Property Name="NI.LV.FPGA.BaseTSConfig.VariableFrequency" Type="Bool">false</Property>
				<Property Name="NI.LV.FPGA.Valid" Type="Bool">true</Property>
				<Property Name="NI.LV.FPGA.Version" Type="Int">5</Property>
			</Item>
			<Item Name="IP Builder" Type="IP Builder Target">
				<Item Name="Dependencies" Type="Dependencies"/>
				<Item Name="Build Specifications" Type="Build"/>
			</Item>
			<Item Name="Multi_Channel" Type="FPGA FIFO">
				<Property Name="Actual Number of Elements" Type="UInt">2047</Property>
				<Property Name="Arbitration for Read" Type="UInt">1</Property>
				<Property Name="Arbitration for Write" Type="UInt">1</Property>
				<Property Name="Control Logic" Type="UInt">0</Property>
				<Property Name="Data Type" Type="UInt">8</Property>
				<Property Name="Disable on Overflow/Underflow" Type="Bool">false</Property>
				<Property Name="fifo.configuration" Type="Str">"ControlLogic=0;NumberOfElements=2047;Type=2;ReadArbs=Arbitrate if Multiple Requestors Only;ElementsPerRead=1;WriteArbs=Arbitrate if Multiple Requestors Only;ElementsPerWrite=1;Implementation=2;Multi_Channel;DataType=100080000000000100094008000355363400010000000000000000000000000000;DisableOnOverflowUnderflow=FALSE"</Property>
				<Property Name="fifo.configured" Type="Bool">true</Property>
				<Property Name="fifo.projectItemValid" Type="Bool">true</Property>
				<Property Name="fifo.valid" Type="Bool">true</Property>
				<Property Name="fifo.version" Type="Int">12</Property>
				<Property Name="FPGA.PersistentID" Type="Str">{C8754F18-F746-4ED6-A6A8-E4D632860FA7}</Property>
				<Property Name="Local" Type="Bool">false</Property>
				<Property Name="Memory Type" Type="UInt">2</Property>
				<Property Name="Number Of Elements Per Read" Type="UInt">1</Property>
				<Property Name="Number Of Elements Per Write" Type="UInt">1</Property>
				<Property Name="Requested Number of Elements" Type="UInt">2047</Property>
				<Property Name="Type" Type="UInt">2</Property>
				<Property Name="Type Descriptor" Type="Str">100080000000000100094008000355363400010000000000000000000000000000</Property>
				<Property Name="Visible" Type="Bool">true</Property>
			</Item>
			<Item Name="Host_to_target" Type="FPGA FIFO">
				<Property Name="Actual Number of Elements" Type="UInt">133</Property>
				<Property Name="Arbitration for Read" Type="UInt">1</Property>
				<Property Name="Arbitration for Write" Type="UInt">1</Property>
				<Property Name="Control Logic" Type="UInt">0</Property>
				<Property Name="Data Type" Type="UInt">7</Property>
				<Property Name="Disable on Overflow/Underflow" Type="Bool">false</Property>
				<Property Name="fifo.configuration" Type="Str">"ControlLogic=0;NumberOfElements=133;Type=1;ReadArbs=Arbitrate if Multiple Requestors Only;ElementsPerRead=1;WriteArbs=Arbitrate if Multiple Requestors Only;ElementsPerWrite=1;Implementation=2;Host_to_target;DataType=1000800000000001000940070003553332000100000000000000000000;DisableOnOverflowUnderflow=FALSE"</Property>
				<Property Name="fifo.configured" Type="Bool">true</Property>
				<Property Name="fifo.projectItemValid" Type="Bool">true</Property>
				<Property Name="fifo.valid" Type="Bool">true</Property>
				<Property Name="fifo.version" Type="Int">12</Property>
				<Property Name="FPGA.PersistentID" Type="Str">{30D0905D-0FAF-440D-BBF4-78073D8E82CD}</Property>
				<Property Name="Local" Type="Bool">false</Property>
				<Property Name="Memory Type" Type="UInt">2</Property>
				<Property Name="Number Of Elements Per Read" Type="UInt">1</Property>
				<Property Name="Number Of Elements Per Write" Type="UInt">1</Property>
				<Property Name="Requested Number of Elements" Type="UInt">133</Property>
				<Property Name="Type" Type="UInt">1</Property>
				<Property Name="Type Descriptor" Type="Str">1000800000000001000940070003553332000100000000000000000000</Property>
			</Item>
			<Item Name="RIO 7961R (FPGA).vi" Type="VI" URL="../RIO 7961R (FPGA).vi">
				<Property Name="configString.guid" Type="Str">{023AA419-BDF7-4384-B70B-94BC2612DBC2}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 3 WE;0;WriteMethodType=bool{084485A6-14B5-43D5-91C0-349F095C9CC9}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 1 WE;0;WriteMethodType=bool{0C087041-C96F-4ACB-B715-30E78FCCF938}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 2 Wr Data;0;WriteMethodType=bool{0C51A0EB-6AE3-4F19-B408-CEDB75C2C1F7}431934833ad3e9a7c9cad4e7878a3e65IOModuleID:0x10937576,Version:15.1.0,National Instruments::NI 5732,SyncClock:CLK1026d873eb92e838e923e5b8196b7992824a62159fea15e1e022e16deffac8f0826163cd1f9189ed3770c0bb9fca4fea8070980ef6da90a5d808ef44eb222fccd58946924f69a7a4d28d421e1971d5b5bd914cf2a79dfd4b33c486ed91c079ba20c95cccd3f4a62e414596cffa39b3701a&lt;Array&gt;
&lt;Name&gt;Generics&lt;/Name&gt;
&lt;Dimsize&gt;0&lt;/Dimsize&gt;
&lt;Cluster&gt;
&lt;Name&gt;CLIP Generic&lt;/Name&gt;
&lt;NumElts&gt;5&lt;/NumElts&gt;
&lt;String&gt;
&lt;Name&gt;Name&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;Type&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;Default value&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;Value&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;Description&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;/Cluster&gt;
&lt;/Array&gt;
&lt;Array&gt;
&lt;Name&gt;Clock Connections&lt;/Name&gt;
&lt;Dimsize&gt;2&lt;/Dimsize&gt;
&lt;Cluster&gt;
&lt;Name&gt;CLIP Clock Connection&lt;/Name&gt;
&lt;NumElts&gt;2&lt;/NumElts&gt;
&lt;Cluster&gt;
&lt;Name&gt;CLIP Clock&lt;/Name&gt;
&lt;NumElts&gt;6&lt;/NumElts&gt;
&lt;String&gt;
&lt;Name&gt;LabVIEW name&lt;/Name&gt;
&lt;Val&gt;Clock 40 MHz&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;VHDL name&lt;/Name&gt;
&lt;Val&gt;Clk40&lt;/Val&gt;
&lt;/String&gt;
&lt;DBL&gt;
&lt;Name&gt;Max Freq&lt;/Name&gt;
&lt;Val&gt;40000000.00000000000000&lt;/Val&gt;
&lt;/DBL&gt;
&lt;DBL&gt;
&lt;Name&gt;Min Freq&lt;/Name&gt;
&lt;Val&gt;40000000.00000000000000&lt;/Val&gt;
&lt;/DBL&gt;
&lt;EW&gt;
&lt;Name&gt;Direction&lt;/Name&gt;
&lt;Choice&gt;ToCLIP&lt;/Choice&gt;
&lt;Choice&gt;FromCLIP&lt;/Choice&gt;
&lt;Choice&gt;Bidirectional&lt;/Choice&gt;
&lt;Val&gt;0&lt;/Val&gt;
&lt;/EW&gt;
&lt;String&gt;
&lt;Name&gt;ClockToLinkTo&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;/Cluster&gt;
&lt;Cluster&gt;
&lt;Name&gt;FPGA Clock&lt;/Name&gt;
&lt;NumElts&gt;3&lt;/NumElts&gt;
&lt;String&gt;
&lt;Name&gt;Name&lt;/Name&gt;
&lt;Val&gt;40 MHz Onboard Clock&lt;/Val&gt;
&lt;/String&gt;
&lt;Boolean&gt;
&lt;Name&gt;Use Top Clock&lt;/Name&gt;
&lt;Val&gt;0&lt;/Val&gt;
&lt;/Boolean&gt;
&lt;Boolean&gt;
&lt;Name&gt;Clock From CLIP&lt;/Name&gt;
&lt;Val&gt;0&lt;/Val&gt;
&lt;/Boolean&gt;
&lt;/Cluster&gt;
&lt;/Cluster&gt;
&lt;Cluster&gt;
&lt;Name&gt;CLIP Clock Connection&lt;/Name&gt;
&lt;NumElts&gt;2&lt;/NumElts&gt;
&lt;Cluster&gt;
&lt;Name&gt;CLIP Clock&lt;/Name&gt;
&lt;NumElts&gt;6&lt;/NumElts&gt;
&lt;String&gt;
&lt;Name&gt;LabVIEW name&lt;/Name&gt;
&lt;Val&gt;Sample Clock&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;VHDL name&lt;/Name&gt;
&lt;Val&gt;SampleClkLv&lt;/Val&gt;
&lt;/String&gt;
&lt;DBL&gt;
&lt;Name&gt;Max Freq&lt;/Name&gt;
&lt;Val&gt;80000000.00000000000000&lt;/Val&gt;
&lt;/DBL&gt;
&lt;DBL&gt;
&lt;Name&gt;Min Freq&lt;/Name&gt;
&lt;Val&gt;80000000.00000000000000&lt;/Val&gt;
&lt;/DBL&gt;
&lt;EW&gt;
&lt;Name&gt;Direction&lt;/Name&gt;
&lt;Choice&gt;ToCLIP&lt;/Choice&gt;
&lt;Choice&gt;FromCLIP&lt;/Choice&gt;
&lt;Choice&gt;Bidirectional&lt;/Choice&gt;
&lt;Val&gt;1&lt;/Val&gt;
&lt;/EW&gt;
&lt;String&gt;
&lt;Name&gt;ClockToLinkTo&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;/Cluster&gt;
&lt;Cluster&gt;
&lt;Name&gt;FPGA Clock&lt;/Name&gt;
&lt;NumElts&gt;3&lt;/NumElts&gt;
&lt;String&gt;
&lt;Name&gt;Name&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;Boolean&gt;
&lt;Name&gt;Use Top Clock&lt;/Name&gt;
&lt;Val&gt;0&lt;/Val&gt;
&lt;/Boolean&gt;
&lt;Boolean&gt;
&lt;Name&gt;Clock From CLIP&lt;/Name&gt;
&lt;Val&gt;1&lt;/Val&gt;
&lt;/Boolean&gt;
&lt;/Cluster&gt;
&lt;/Cluster&gt;
&lt;/Array&gt;
{173AB736-AE6E-4D32-AD2E-3443228EAA17}NumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/Initialization Done;0;ReadMethodType=bool{1BE802ED-283C-4B7D-A841-E29879259579}NumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/User Command Status;0;ReadMethodType=U8{1E986F3F-F9DF-416A-9ACA-F27636BF6918}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 0 WE;0;WriteMethodType=bool{1FD8C95B-A53D-4698-9B87-420D27CF72D2}NumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/AI 1 Over Range;0;ReadMethodType=bool{24FA93DA-AEE7-43B6-894F-570BD7679526}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/DIO Port 1 WE;0;WriteMethodType=bool{30D0905D-0FAF-440D-BBF4-78073D8E82CD}"ControlLogic=0;NumberOfElements=133;Type=1;ReadArbs=Arbitrate if Multiple Requestors Only;ElementsPerRead=1;WriteArbs=Arbitrate if Multiple Requestors Only;ElementsPerWrite=1;Implementation=2;Host_to_target;DataType=1000800000000001000940070003553332000100000000000000000000;DisableOnOverflowUnderflow=FALSE"{3EC811B6-E363-4FC2-A6C0-78C90C6AA66D}ResourceName=IO ModuleA_ASample Clock;TopSignalConnect=IO_ModuleA_ASampleClkLv;ClockSignalName=IO_ModuleA_ASampleClkLv;MinFreq=80000000.000000;MaxFreq=80000000.000000;VariableFreq=0;NomFreq=80000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=45.000000;MaxDutyCycle=55.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;{42645120-A796-4392-83CA-BDB7DACDF525}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/User Command;0;WriteMethodType=U8{4D615A83-5944-43C2-A7D0-0DFCE5FC8BFA}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/DIO Port 0 WE;0;WriteMethodType=bool{4F3E3145-2F6A-4A7B-9FEC-518BDFD95F6E}NumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/SPI Read Data;0;ReadMethodType=U8{50107835-FCDF-4764-8C9C-3F3C511A2A37}NumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/User Return;0;ReadMethodType=U16{5150FCD7-5489-4EB3-BCFC-5B5012EC1024}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 0 Wr Data;0;WriteMethodType=bool{5579BF21-F618-44AA-BAB7-9D659DDD842B}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/SPI Device Select;0;WriteMethodType=U8{55BD4204-0920-4BB4-9591-38490A073A9F}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/DIO Port 1 Wr Data;0;WriteMethodType=U8{5F045765-DADE-499E-A676-AFEB6C692253}NumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/AI 0;0;ReadMethodType=U16{5F5BEDA4-29B2-48B2-AE74-775727823EC7}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 3 Wr Data;0;WriteMethodType=bool{6CBCB05E-9479-4A6A-B7FB-CD8A02E47981}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module/SignalList/DIO Port 1 Rd Data;0;ReadMethodType=U8{7944625B-5AB7-4CEA-AE15-DB0B42013669}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module/SignalList/PFI 3 Rd Data;0;ReadMethodType=bool{7ACD5512-AA81-4C36-8F48-546E508E9F31}ResourceName=40 MHz Onboard Clock;TopSignalConnect=RioClk40;ClockSignalName=RioClk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;{7D40381A-49EB-4928-AB5F-DE552D6AC27B}NumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/AI 0 Over Range;0;ReadMethodType=bool{86A88140-24E3-4B23-8D6B-D827DAA43C83}NumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/User Command Idle;0;ReadMethodType=bool{8AAA250B-A288-4BFA-8C93-E9A3C5CBCF6D}NumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/PLL Locked;0;ReadMethodType=bool{93EF48FB-5C5F-4E58-9E8A-2899BCC9C55D}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 1 Wr Data;0;WriteMethodType=bool{96B502D3-977B-4EC4-9D1A-5CB5BDE98728}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module/SignalList/DIO Port 0 Rd Data;0;ReadMethodType=U8{A1C94580-E034-4216-BBDD-0447D0B17A78}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 2 WE;0;WriteMethodType=bool{A82CC67A-BAC3-47D0-B287-7AB4853BD223}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/SPI Write Data;0;WriteMethodType=U16{AECEF0D8-40CE-420C-875C-E224C40F2484}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module/SignalList/PFI 1 Rd Data;0;ReadMethodType=bool{AF381BBF-4993-43D8-B0E9-0428AD000BBA}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module/SignalList/DC Over Voltage;0;ReadMethodType=U8{B8D6A9FC-ABB8-4F87-8389-C1F57D096653}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/SPI Address;0;WriteMethodType=U16{C8754F18-F746-4ED6-A6A8-E4D632860FA7}"ControlLogic=0;NumberOfElements=2047;Type=2;ReadArbs=Arbitrate if Multiple Requestors Only;ElementsPerRead=1;WriteArbs=Arbitrate if Multiple Requestors Only;ElementsPerWrite=1;Implementation=2;Multi_Channel;DataType=100080000000000100094008000355363400010000000000000000000000000000;DisableOnOverflowUnderflow=FALSE"{CAF62FF4-FA07-4702-B99B-34C0CA520998}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/User Data 0;0;WriteMethodType=U8{CC93FEC2-2EAD-4228-9A82-4FE45693F4BC}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/SPI Write;0;WriteMethodType=bool{D0EECF58-116D-4BCA-A88C-C1982A588587}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/User Data 1;0;WriteMethodType=U8{D299B906-FD79-444D-A645-DF4E0711E0F6}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/SPI Read;0;WriteMethodType=bool{D5EEEA61-5986-4026-807B-F63EF7CEBD4D}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module/SignalList/PFI 0 Rd Data;0;ReadMethodType=bool{D7A7BA27-EDE6-490F-A916-B4420F31577A}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/User Command Commit;0;WriteMethodType=bool{E0E357A2-C6FC-41EE-9325-6D169DB7FD56}NumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/User Error;0;ReadMethodType=U8{E1DA2EBB-BC77-4751-A50E-EB738230123E}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module/SignalList/PFI 2 Rd Data;0;ReadMethodType=bool{E9719A58-2C34-4830-8A8A-34685291A794}NumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/AI 1;0;ReadMethodType=U16{F5535155-E68B-48FC-856D-DA1461543EE4}NumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/SPI Idle;0;ReadMethodType=bool{F95181D5-02F3-410C-A733-D9EDC797479C}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/DIO Port 0 Wr Data;0;WriteMethodType=U8PXIe-7961R/RioClk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSPXIE_7961RFPGA_TARGET_FAMILYVIRTEX5TARGET_TYPEFPGA</Property>
				<Property Name="configString.name" Type="Str">40 MHz Onboard ClockResourceName=40 MHz Onboard Clock;TopSignalConnect=RioClk40;ClockSignalName=RioClk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;AI 0 Over RangeNumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/AI 0 Over Range;0;ReadMethodType=boolAI 0NumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/AI 0;0;ReadMethodType=U16AI 1 Over RangeNumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/AI 1 Over Range;0;ReadMethodType=boolAI 1NumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/AI 1;0;ReadMethodType=U16DC Over VoltageNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module/SignalList/DC Over Voltage;0;ReadMethodType=U8DIO Port 0 Rd DataNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module/SignalList/DIO Port 0 Rd Data;0;ReadMethodType=U8DIO Port 0 WEArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/DIO Port 0 WE;0;WriteMethodType=boolDIO Port 0 Wr DataArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/DIO Port 0 Wr Data;0;WriteMethodType=U8DIO Port 1 Rd DataNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module/SignalList/DIO Port 1 Rd Data;0;ReadMethodType=U8DIO Port 1 WEArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/DIO Port 1 WE;0;WriteMethodType=boolDIO Port 1 Wr DataArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/DIO Port 1 Wr Data;0;WriteMethodType=U8Host_to_target"ControlLogic=0;NumberOfElements=133;Type=1;ReadArbs=Arbitrate if Multiple Requestors Only;ElementsPerRead=1;WriteArbs=Arbitrate if Multiple Requestors Only;ElementsPerWrite=1;Implementation=2;Host_to_target;DataType=1000800000000001000940070003553332000100000000000000000000;DisableOnOverflowUnderflow=FALSE"Initialization DoneNumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/Initialization Done;0;ReadMethodType=boolIO Module431934833ad3e9a7c9cad4e7878a3e65IOModuleID:0x10937576,Version:15.1.0,National Instruments::NI 5732,SyncClock:CLK1026d873eb92e838e923e5b8196b7992824a62159fea15e1e022e16deffac8f0826163cd1f9189ed3770c0bb9fca4fea8070980ef6da90a5d808ef44eb222fccd58946924f69a7a4d28d421e1971d5b5bd914cf2a79dfd4b33c486ed91c079ba20c95cccd3f4a62e414596cffa39b3701a&lt;Array&gt;
&lt;Name&gt;Generics&lt;/Name&gt;
&lt;Dimsize&gt;0&lt;/Dimsize&gt;
&lt;Cluster&gt;
&lt;Name&gt;CLIP Generic&lt;/Name&gt;
&lt;NumElts&gt;5&lt;/NumElts&gt;
&lt;String&gt;
&lt;Name&gt;Name&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;Type&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;Default value&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;Value&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;Description&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;/Cluster&gt;
&lt;/Array&gt;
&lt;Array&gt;
&lt;Name&gt;Clock Connections&lt;/Name&gt;
&lt;Dimsize&gt;2&lt;/Dimsize&gt;
&lt;Cluster&gt;
&lt;Name&gt;CLIP Clock Connection&lt;/Name&gt;
&lt;NumElts&gt;2&lt;/NumElts&gt;
&lt;Cluster&gt;
&lt;Name&gt;CLIP Clock&lt;/Name&gt;
&lt;NumElts&gt;6&lt;/NumElts&gt;
&lt;String&gt;
&lt;Name&gt;LabVIEW name&lt;/Name&gt;
&lt;Val&gt;Clock 40 MHz&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;VHDL name&lt;/Name&gt;
&lt;Val&gt;Clk40&lt;/Val&gt;
&lt;/String&gt;
&lt;DBL&gt;
&lt;Name&gt;Max Freq&lt;/Name&gt;
&lt;Val&gt;40000000.00000000000000&lt;/Val&gt;
&lt;/DBL&gt;
&lt;DBL&gt;
&lt;Name&gt;Min Freq&lt;/Name&gt;
&lt;Val&gt;40000000.00000000000000&lt;/Val&gt;
&lt;/DBL&gt;
&lt;EW&gt;
&lt;Name&gt;Direction&lt;/Name&gt;
&lt;Choice&gt;ToCLIP&lt;/Choice&gt;
&lt;Choice&gt;FromCLIP&lt;/Choice&gt;
&lt;Choice&gt;Bidirectional&lt;/Choice&gt;
&lt;Val&gt;0&lt;/Val&gt;
&lt;/EW&gt;
&lt;String&gt;
&lt;Name&gt;ClockToLinkTo&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;/Cluster&gt;
&lt;Cluster&gt;
&lt;Name&gt;FPGA Clock&lt;/Name&gt;
&lt;NumElts&gt;3&lt;/NumElts&gt;
&lt;String&gt;
&lt;Name&gt;Name&lt;/Name&gt;
&lt;Val&gt;40 MHz Onboard Clock&lt;/Val&gt;
&lt;/String&gt;
&lt;Boolean&gt;
&lt;Name&gt;Use Top Clock&lt;/Name&gt;
&lt;Val&gt;0&lt;/Val&gt;
&lt;/Boolean&gt;
&lt;Boolean&gt;
&lt;Name&gt;Clock From CLIP&lt;/Name&gt;
&lt;Val&gt;0&lt;/Val&gt;
&lt;/Boolean&gt;
&lt;/Cluster&gt;
&lt;/Cluster&gt;
&lt;Cluster&gt;
&lt;Name&gt;CLIP Clock Connection&lt;/Name&gt;
&lt;NumElts&gt;2&lt;/NumElts&gt;
&lt;Cluster&gt;
&lt;Name&gt;CLIP Clock&lt;/Name&gt;
&lt;NumElts&gt;6&lt;/NumElts&gt;
&lt;String&gt;
&lt;Name&gt;LabVIEW name&lt;/Name&gt;
&lt;Val&gt;Sample Clock&lt;/Val&gt;
&lt;/String&gt;
&lt;String&gt;
&lt;Name&gt;VHDL name&lt;/Name&gt;
&lt;Val&gt;SampleClkLv&lt;/Val&gt;
&lt;/String&gt;
&lt;DBL&gt;
&lt;Name&gt;Max Freq&lt;/Name&gt;
&lt;Val&gt;80000000.00000000000000&lt;/Val&gt;
&lt;/DBL&gt;
&lt;DBL&gt;
&lt;Name&gt;Min Freq&lt;/Name&gt;
&lt;Val&gt;80000000.00000000000000&lt;/Val&gt;
&lt;/DBL&gt;
&lt;EW&gt;
&lt;Name&gt;Direction&lt;/Name&gt;
&lt;Choice&gt;ToCLIP&lt;/Choice&gt;
&lt;Choice&gt;FromCLIP&lt;/Choice&gt;
&lt;Choice&gt;Bidirectional&lt;/Choice&gt;
&lt;Val&gt;1&lt;/Val&gt;
&lt;/EW&gt;
&lt;String&gt;
&lt;Name&gt;ClockToLinkTo&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;/Cluster&gt;
&lt;Cluster&gt;
&lt;Name&gt;FPGA Clock&lt;/Name&gt;
&lt;NumElts&gt;3&lt;/NumElts&gt;
&lt;String&gt;
&lt;Name&gt;Name&lt;/Name&gt;
&lt;Val&gt;&lt;/Val&gt;
&lt;/String&gt;
&lt;Boolean&gt;
&lt;Name&gt;Use Top Clock&lt;/Name&gt;
&lt;Val&gt;0&lt;/Val&gt;
&lt;/Boolean&gt;
&lt;Boolean&gt;
&lt;Name&gt;Clock From CLIP&lt;/Name&gt;
&lt;Val&gt;1&lt;/Val&gt;
&lt;/Boolean&gt;
&lt;/Cluster&gt;
&lt;/Cluster&gt;
&lt;/Array&gt;
Multi_Channel"ControlLogic=0;NumberOfElements=2047;Type=2;ReadArbs=Arbitrate if Multiple Requestors Only;ElementsPerRead=1;WriteArbs=Arbitrate if Multiple Requestors Only;ElementsPerWrite=1;Implementation=2;Multi_Channel;DataType=100080000000000100094008000355363400010000000000000000000000000000;DisableOnOverflowUnderflow=FALSE"PFI 0 Rd DataNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module/SignalList/PFI 0 Rd Data;0;ReadMethodType=boolPFI 0 WEArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 0 WE;0;WriteMethodType=boolPFI 0 Wr DataArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 0 Wr Data;0;WriteMethodType=boolPFI 1 Rd DataNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module/SignalList/PFI 1 Rd Data;0;ReadMethodType=boolPFI 1 WEArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 1 WE;0;WriteMethodType=boolPFI 1 Wr DataArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 1 Wr Data;0;WriteMethodType=boolPFI 2 Rd DataNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module/SignalList/PFI 2 Rd Data;0;ReadMethodType=boolPFI 2 WEArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 2 WE;0;WriteMethodType=boolPFI 2 Wr DataArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 2 Wr Data;0;WriteMethodType=boolPFI 3 Rd DataNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module/SignalList/PFI 3 Rd Data;0;ReadMethodType=boolPFI 3 WEArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 3 WE;0;WriteMethodType=boolPFI 3 Wr DataArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;resource=/IO Module/SignalList/PFI 3 Wr Data;0;WriteMethodType=boolPLL LockedNumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/PLL Locked;0;ReadMethodType=boolPXIe-7961R/RioClk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSPXIE_7961RFPGA_TARGET_FAMILYVIRTEX5TARGET_TYPEFPGASample ClockResourceName=IO ModuleA_ASample Clock;TopSignalConnect=IO_ModuleA_ASampleClkLv;ClockSignalName=IO_ModuleA_ASampleClkLv;MinFreq=80000000.000000;MaxFreq=80000000.000000;VariableFreq=0;NomFreq=80000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=45.000000;MaxDutyCycle=55.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;SPI AddressArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/SPI Address;0;WriteMethodType=U16SPI Device SelectArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/SPI Device Select;0;WriteMethodType=U8SPI IdleNumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/SPI Idle;0;ReadMethodType=boolSPI Read DataNumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/SPI Read Data;0;ReadMethodType=U8SPI ReadArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/SPI Read;0;WriteMethodType=boolSPI Write DataArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/SPI Write Data;0;WriteMethodType=U16SPI WriteArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/SPI Write;0;WriteMethodType=boolUser Command CommitArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/User Command Commit;0;WriteMethodType=boolUser Command IdleNumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/User Command Idle;0;ReadMethodType=boolUser Command StatusNumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/User Command Status;0;ReadMethodType=U8User CommandArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/User Command;0;WriteMethodType=U8User Data 0ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/User Data 0;0;WriteMethodType=U8User Data 1ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=0;resource=/IO Module/SignalList/User Data 1;0;WriteMethodType=U8User ErrorNumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/User Error;0;ReadMethodType=U8User ReturnNumberOfSyncRegistersForReadInProject=0;resource=/IO Module/SignalList/User Return;0;ReadMethodType=U16</Property>
				<Property Name="NI.LV.FPGA.InterfaceBitfile" Type="Str">C:\Users\CHEN Lab WorkStation\Desktop\summer_intern\Try5\FPGA Bitfiles\DMDControlPXIAcq_PXIe-7961R_RIO7961R(FPGA)_hSkEQgsNMdM.lvbitx</Property>
			</Item>
			<Item Name="Dependencies" Type="Dependencies">
				<Item Name="vi.lib" Type="Folder">
					<Item Name="lvSimController.dll" Type="Document" URL="/&lt;vilib&gt;/rvi/Simulation/lvSimController.dll"/>
				</Item>
			</Item>
			<Item Name="Build Specifications" Type="Build">
				<Item Name="RIO 7961R (FPGA)" Type="{F4C5E96F-7410-48A5-BB87-3559BC9B167F}">
					<Property Name="AllowEnableRemoval" Type="Bool">false</Property>
					<Property Name="BuildSpecDecription" Type="Str"></Property>
					<Property Name="BuildSpecName" Type="Str">RIO 7961R (FPGA)</Property>
					<Property Name="Comp.BitfileName" Type="Str">DMDControlPXIAcq_PXIe-7961R_RIO7961R(FPGA)_hSkEQgsNMdM.lvbitx</Property>
					<Property Name="Comp.CustomXilinxParameters" Type="Str"></Property>
					<Property Name="Comp.MaxFanout" Type="Int">-1</Property>
					<Property Name="Comp.RandomSeed" Type="Bool">false</Property>
					<Property Name="Comp.Version.Build" Type="Int">0</Property>
					<Property Name="Comp.Version.Fix" Type="Int">0</Property>
					<Property Name="Comp.Version.Major" Type="Int">1</Property>
					<Property Name="Comp.Version.Minor" Type="Int">0</Property>
					<Property Name="Comp.VersionAutoIncrement" Type="Bool">false</Property>
					<Property Name="Comp.Vivado.EnableMultiThreading" Type="Bool">true</Property>
					<Property Name="Comp.Vivado.OptDirective" Type="Str"></Property>
					<Property Name="Comp.Vivado.PhysOptDirective" Type="Str"></Property>
					<Property Name="Comp.Vivado.PlaceDirective" Type="Str"></Property>
					<Property Name="Comp.Vivado.RouteDirective" Type="Str"></Property>
					<Property Name="Comp.Vivado.RunPowerOpt" Type="Bool">false</Property>
					<Property Name="Comp.Vivado.Strategy" Type="Str">Default</Property>
					<Property Name="Comp.Xilinx.DesignStrategy" Type="Str">balanced</Property>
					<Property Name="Comp.Xilinx.MapEffort" Type="Str">high(timing)</Property>
					<Property Name="Comp.Xilinx.ParEffort" Type="Str">standard</Property>
					<Property Name="Comp.Xilinx.SynthEffort" Type="Str">normal</Property>
					<Property Name="Comp.Xilinx.SynthGoal" Type="Str">speed</Property>
					<Property Name="Comp.Xilinx.UseRecommended" Type="Bool">true</Property>
					<Property Name="DefaultBuildSpec" Type="Bool">true</Property>
					<Property Name="DestinationDirectory" Type="Path">FPGA Bitfiles</Property>
					<Property Name="NI.LV.FPGA.LastCompiledBitfilePath" Type="Path">/C/Users/CHEN Lab WorkStation/Desktop/summer_intern/Try5/FPGA Bitfiles/DMDControlPXIAcq_PXIe-7961R_RIO7961R(FPGA)_hSkEQgsNMdM.lvbitx</Property>
					<Property Name="NI.LV.FPGA.LastCompiledBitfilePathRelativeToProject" Type="Path">FPGA Bitfiles/DMDControlPXIAcq_PXIe-7961R_RIO7961R(FPGA)_hSkEQgsNMdM.lvbitx</Property>
					<Property Name="ProjectPath" Type="Path">/C/Users/CHEN Lab WorkStation/Desktop/summer_intern/Try5/DMD_Control_PXI_Acq.lvproj</Property>
					<Property Name="RelativePath" Type="Bool">true</Property>
					<Property Name="RunWhenLoaded" Type="Bool">false</Property>
					<Property Name="SupportDownload" Type="Bool">true</Property>
					<Property Name="SupportResourceEstimation" Type="Bool">true</Property>
					<Property Name="TargetName" Type="Str">PXIe-7961R</Property>
					<Property Name="TopLevelVI" Type="Ref">/My Computer/PXIe-7961R/RIO 7961R (FPGA).vi</Property>
				</Item>
			</Item>
		</Item>
		<Item Name="if_3_3561858.ico" Type="Document" URL="../../../if_3_3561858.ico"/>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="TPM_Ctrl" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{568FD152-4100-4883-9BD8-9064E39DF294}</Property>
				<Property Name="App_INI_GUID" Type="Str">{15906D05-223F-4E67-AF2E-21F57676D5EE}</Property>
				<Property Name="App_serverConfig.httpPort" Type="Int">8002</Property>
				<Property Name="App_winsec.description" Type="Str">http://www.CUHK.com</Property>
				<Property Name="Bld_autoIncrement" Type="Bool">true</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{A3B20BC4-E735-49BE-B200-DB1BA69D6D1D}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">TPM_Ctrl</Property>
				<Property Name="Bld_excludeInlineSubVIs" Type="Bool">true</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../builds/NI_AB_PROJECTNAME/TPM_Ctrl</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{7F6E0B77-BD60-4EFB-A960-6C2796DEDF4B}</Property>
				<Property Name="Bld_version.build" Type="Int">1</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">TPM.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../builds/NI_AB_PROJECTNAME/TPM_Ctrl/TPM.exe</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../builds/NI_AB_PROJECTNAME/TPM_Ctrl/data</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Exe_iconItemID" Type="Ref">/My Computer/if_3_3561858.ico</Property>
				<Property Name="Source[0].itemID" Type="Str">{9BA725E9-C67A-4C84-937A-6606F2E46BBD}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/DMD_Control_PXI_Acq.vi</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="Source[2].Container.applyInclusion" Type="Bool">true</Property>
				<Property Name="Source[2].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[2].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[2].itemID" Type="Ref">/My Computer/Library</Property>
				<Property Name="Source[2].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[2].type" Type="Str">Container</Property>
				<Property Name="SourceCount" Type="Int">3</Property>
				<Property Name="TgtF_companyName" Type="Str">CUHK</Property>
				<Property Name="TgtF_fileDescription" Type="Str">TPM_Ctrl</Property>
				<Property Name="TgtF_internalName" Type="Str">TPM_Ctrl</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright ?2018 CUHK</Property>
				<Property Name="TgtF_productName" Type="Str">TPM_Ctrl</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{FE177955-923F-4FE8-80F4-BF701606F539}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">TPM.exe</Property>
			</Item>
		</Item>
	</Item>
</Project>
