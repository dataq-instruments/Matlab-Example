# Matlab Example
 Matlab example for DI-1100, 1110, 1120, 2108, 2108P, 4108, 4208, 4718 and 4730, USB mode only
 To use it, one must change the device from LibUSB mode (WinDaq capable) to CDC mode first. Do do so, follow the steps below:
 
 Connect the device to computer
 Once you see the blinking green light blinking, push and hold the button
 Wait until the LED turns white then red
 release the button and the device will be switched to CDC mode, and blinks yellow

 To run the example, you need to locate the COM port the device is connected to
 
 For PC, open Windows->Control Panel->Device Manager and you will find the COM port listed under Port (LPT and COM)
![alt text](https://www.dataq.com/resources/repository/matlab_devicemanager.png)
