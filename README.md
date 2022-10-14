# Matlab Example
 Windows PC and Mac Matlab example for DI-188, DI-1100, DI-1110, DI-1120, DI_2008, DI-2108, DI-4108, DI-4208, DI-4718, and DI-4730, USB mode only

 For DI-2008, make sure the firmware rev is at least 1.15

 For DI-1100, DI-1110, DI-1120, DI-2008, DI-2108, DI-4108, DI-4208, DI-4718, and DI-4730, one must change the device from LibUSB mode (WinDaq capable, blinking green when idle) to **CDC mode (blinking yellow when idle)** first. 
 
 ```diff
-How to change the device from LibUSB mode to CDC mode
 ```
 
 1. If your device is DI-188, skip the rest, it is always in CDC mode

 2. Connect the device to computer

 3. If the device blinks yellow, skip the rest, it is already in CDC mode
 
 4. If your device is DI-2008, skip to Step 8
 
 5. Once you see the blinking green light blinking, immediately push and hold the button
 
 6. Wait until the LED turns white then red
 
 7. Release the button and the device will be switched to CDC mode, and blinks yellow. Skip to 10

 8. The following step is for DI-2008 only
 
 9. When you see DI-2008 blinks green, press and release the button at 1 hz rate, until DI-2008 switch to CDC mode, and blinks yellow. 

10. Repeat the above operation if you need to switch back to LibUSB mode

```diff
+To run the example, you need to locate the COM port the device is connected to. For USB device, the baudrate is not important
```
 
 **For PC**:
 
 1) Open Windows->Control Panel->Device Manager and find find the COM port listed under Ports (COM & LPT), in the screen capture below, 2108 is on COM 4 <br/> 
![alt text](https://www.dataq.com/resources/repository/matlab_devicemanager.png)

**For Mac**:
 
 1. Don't plug in the Dataq device
 
 2. At  Matlab prompt under command window (looks like >>), type seriealportlist and press enter, this will show the existing ports: <br/> 
![alt text](https://www.dataq.com/resources/repository/matlab_image001.png)

 3. Plug the Dataq device into the USB port (make sure it is in CDC mode!) and issue the same command <br/> 
 ![alt text](https://www.dataq.com/resources/repository/matlab_image002.png)
 
 4. You will see two more devices appear in the list.  Choose one of them (in my case I used /dev/tty.usbmodemFA131) as the port.  I think either one (tty or cu) works.  Unfortunately, it does not show the entire detail (cuts FA131 out).  To see that, you can bring up the Workspace tab by clicking on it: <br/> 
 ![alt text](https://www.dataq.com/resources/repository/matlab_image003.png)
 
 5) Double click on the “ans” variable to see the four ports (adjust column width):<br/> 
 ![alt text](https://www.dataq.com/resources/repository/matlab_image005.png)
 
 6) Once you locate the correct COM port and modify the Matlab program accordingly, you can run the program. 
 
 **Test Drive**
 
  - Below is the capture of a test run <br/> 
  ![alt text](https://www.dataq.com/resources/repository/matlab_matlaboutput.png)
  
 
 **Extra Notes**
  
 - Most examples here use ASCII output mode ("encode 1"), but if higher sample rate is needed, it is necessary to program the device to binary output mode, thus "encode 0" and "ps" command should be employed, and readline should be changed to read. One binary example is shown here, [DI_With_Matlab_binary.m](https://github.com/dataq-instruments/Matlab-Example/blob/master/DI_With_Matlab_binary.m). You may find more info regarding binary read in https://www.mathworks.com/help/matlab/ref/serialport.read.html:
 
 _&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for i=1:numOfData_
 
 _&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;% Read the data_
    
 _&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data = readline(s);_
    
 _&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;% Convert to number_
    
 _&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NumData(i) = str2double(data);_
    
_&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;end_

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;could be changed to 

_&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for i=1:numOfData_

_&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;% Read the data_
    
_&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data=read(s,1,"int16");_
    
_&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;% Convert to number_
    
_&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NumData(i) = double(data);_
    
_&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;end_
 
- Callback may be employed https://www.mathworks.com/help/matlab/ref/serialport.configurecallback.html
 
- To use binary mode with DI-1100, DI-1110, DI-1120, DI-2108, DI-4108, DI-4208, DI-4718, and DI-4730, firmware 1.35 or higher is recommended https://github.com/dataq-instruments/Firmware_Upgrade. 
 
- If you wish to know more about the protocol behind the program, for DI-1100, DI-1110, DI-1120, DI-2008, DI-2108, DI-4108, DI-4208, DI-4718, and DI-4730, please visit https://www.dataq.com/resources/pdfs/misc/Dataq-Instruments-Protocol.pdf. For DI-188, please visit https://www.dataq.com/resources/pdfs/misc/di-188-protocol.pdf
 
 
