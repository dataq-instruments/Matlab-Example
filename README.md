# Matlab Example
 Windows PC and Mac Matlab example for DI-188, DI-1100, DI-1110, DI-1120, DI-2108, DI-2108P, DI-4108, DI-4208, DI-4718, and DI-4730, USB mode, without using .NET class
 
 To try this example, one must change the device from LibUSB mode (WinDaq capable, blinking green when idle) to **CDC mode (blinking yellow when idle)** first. 
 
 ```diff
-To do so, follow the steps below:
 ```
 
 1. Connect the device to computer
 
 2. Once you see the blinking green light blinking, immediately push and hold the button
 
 3. Wait until the LED turns white then red
 
 4. Release the button and the device will be switched to CDC mode, and blinks yellow

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
  
 - The example uses ASCII output mode ("encode 1"), but if higher sample rate is needed, it is necessary to program the device to binary output mode, thus "encode 0" should be used, and readline should be changed to read. See https://www.mathworks.com/help/matlab/ref/serialport.read.html as reference:
 
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
 
- To use binary mode, firmware 1.35 or higher is recommended https://github.com/dataq-instruments/Firmware_Upgrade. 
 
- If you wish to know more about the protocol behind the program, please visit https://www.dataq.com/resources/pdfs/misc/Dataq-Instruments-Protocol.pdf
 
 
