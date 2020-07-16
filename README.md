# Matlab Example
 Matlab example for DI-1100, 1110, 1120, 2108, 2108P, 4108, 4208, 4718 and 4730, USB mode only
 To use it, one must change the device from LibUSB mode (WinDaq capable) to CDC mode first. Do do so, follow the steps below:
 
 Connect the device to computer
 Once you see the blinking green light blinking, push and hold the button
 Wait until the LED turns white then red
 release the button and the device will be switched to CDC mode, and blinks yellow

 To run the example, you need to locate the COM port the device is connected to
 
 For PC, open Windows->Control Panel->Device Manager and you will find the COM port listed under Ports (COM & LPT), in the screen capture below, 2108 is on COM 4
![alt text](https://www.dataq.com/resources/repository/matlab_devicemanager.png)

 For Mac, follow the steps below:
 1. Don't plug in the Dataq device
 2. At  Matlab prompt under command window (looks like >>), type seriealportlist and press enter, this will show the existing ports:
 
![alt text](https://www.dataq.com/resources/repository/matlab_image001.png)

 3. Plug the Dataq device into the USB port (make sure it is in CDC mode!) and issue the same command
 
 ![alt text](https://www.dataq.com/resources/repository/matlab_image002.png)
 
 4. You will see two more devices appear in the list.  Choose one of them (in my case I used /dev/tty.usbmodemFA131) as the port.  I think either one (tty or cu) works.  Unfortunately, it does not show the entire detail (cuts FA131 out).  To see that, you can bring up the Workspace tab by clicking on it:
 
 ![alt text](https://www.dataq.com/resources/repository/matlab_image003.png)
 
 Double click on the “ans” variable to see the four ports (adjust column width):
 
 ![alt text](https://www.dataq.com/resources/repository/matlab_image005.png)
 
 Once you select the correct COM port, you can run the program and here is the capture of my run
 
  ![alt text](https://www.dataq.com/resources/repository/matlab_matlaboutput.png)
