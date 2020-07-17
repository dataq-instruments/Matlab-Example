
% Dataq DI 1100, DI2100, DI4000 series with MATLAB R2019b
%
% The device must be in CDC mode
%
% See README in the project for useful discussion
%================================================

clear, clc

numOfData = 100;   
% port = "/dev/tty.usbmodemFA131";    % For Mac OS
port = "COM4";    % For Windows, in device manager's Ports (COM & LPT)
baudrate = 115200;
s = serialport(port, baudrate, "Timeout", 5);
configureTerminator(s, "CR")
% Clear serial buffer
flush(s)

% Check if device responds
writeline(s, "info 1")
pause(1)
data = readline(s)

% Configure

% Stop in case device was already running
writeline(s, "stop")
pause(0.1)

% Ending char for output in ascii mode is CR
writeline(s, "eol 0")
pause(0.1)

% Set up for ascii communication
writeline(s, "encode 1")
pause(0.1)
data = readline(s);

% Set up channel(s) to scan
writeline(s, "slist 0 0")
pause(0.1)

% Rate and other setup
writeline(s, "srate 60000")
pause(0.1)
writeline(s, "dec 5")
pause(0.1)
writeline(s, "deca 1")
pause(1)

% Flush the port buffer
flush(s)

% Start scanning
writeline(s, "start")
pause(0.1)

% Read data
for i=1:numOfData
    % Read the data
    data = readline(s);
    % Convert to number
    NumData(i) = str2double(data);
end

% Stop data acquisition
writeline(s, "stop")

% Plot data
figure(1)
plot(NumData, 'o-');
grid on; ylabel('Value'); xlabel('sample')

% Calculate average
aveValue = mean(NumData)

% Close the port
clear s
