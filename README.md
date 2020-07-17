# Matlab Example
 Windows PC and Mac Matlab example for DI-1100, DI-1110, DI-1120, DI-2108, DI-2108P, DI-4108, DI-4208, DI-4718 and DI-4730, USB mode
 
  To use it, one must change the device from LibUSB mode (WinDaq capable, blinking green when idle) to **CDC mode (blinking yellow when idle)** first. 
 
 ```diff
-To do so, follow the steps below:
 ```
 
 1. Connect the device to computer
 
 2. Once you see the blinking green light blinking, push and hold the button
 
 3. Wait until the LED turns white then red
 
 4. Release the button and the device will be switched to CDC mode, and blinks yellow

```diff
 -To run the example, you need to locate the COM port the device is connected to
```
 
 **For PC**, open Windows->Control Panel->Device Manager and you will find the COM port listed under Ports (COM & LPT), in the screen capture below, 2108 is on COM 4
 
![alt text](https://www.dataq.com/resources/repository/matlab_devicemanager.png)

**For Mac, follow the steps below**:
 
 1. Don't plug in the Dataq device
 
 2. At  Matlab prompt under command window (looks like >>), type seriealportlist and press enter, this will show the existing ports:
 
![alt text](https://www.dataq.com/resources/repository/matlab_image001.png)

 3. Plug the Dataq device into the USB port (make sure it is in CDC mode!) and issue the same command
 
 ![alt text](https://www.dataq.com/resources/repository/matlab_image002.png)
 
 4. You will see two more devices appear in the list.  Choose one of them (in my case I used /dev/tty.usbmodemFA131) as the port.  I think either one (tty or cu) works.  Unfortunately, it does not show the entire detail (cuts FA131 out).  To see that, you can bring up the Workspace tab by clicking on it:
 
 ![alt text](https://www.dataq.com/resources/repository/matlab_image003.png)
 
 Double click on the “ans” variable to see the four ports (adjust column width):
 
 ![alt text](https://www.dataq.com/resources/repository/matlab_image005.png)
 
 Once you locate the correct COM port and modify the Matlab program accordingly, you can run the program. 
 
 Below is the capture of a test run
 
  ![alt text](https://www.dataq.com/resources/repository/matlab_matlaboutput.png)
  
 ```diff
 -Side Notes
 ```diff
 
 The example uses ASCII output mode ("encode 1"), but if higher sample rate is needed, it is necessary to program the device to binary output mode, thus "encode 0" should be used, and readline should be changed to read https://www.mathworks.com/help/matlab/ref/serialport.read.html, for example:
 
 _for i=1:numOfData_
 
 _&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;% Read the data_
    
 _&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data = readline(s);_
    
 _&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;% Convert to number_
    
 _&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NumData(i) = str2double(data);_
    
_end_

could be changed to 

_for i=1:numOfData_

_&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;% Read the data_
    
_&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data=read(s,1,"int16");_
    
_&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;% Convert to number_
    
_&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NumData(i) = double(data);_
    
_end_
 
 Callback may be employed https://www.mathworks.com/help/matlab/ref/serialport.configurecallback.html
 
