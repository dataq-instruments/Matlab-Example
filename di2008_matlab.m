
% Dataq DI 2008 series with MATLAB R2019b
%
% The device must be in CDC mode, follow README discussion
%
% See README in the project for useful discussion
%================================================

clear, clc

numOfData = 100;   
% port = "/dev/tty.usbmodemFA131";    % For Mac OS, follow README discussion
port = "COM6";    % For Windows, in device manager's Ports (COM & LPT)
baudrate = 115200;
s = serialport(port, baudrate);
configureTerminator(s, "CR")
% Clear serial buffer
flush(s)

% Stop in case device was already running
writeline(s, "stop")
pause(0.1)

% Check if device responds
writeline(s, "info 0")
pause(1)
data = readline(s)

% Configure

% Ending char for output in ascii mode is CR
writeline(s, "eol 0")
pause(0.1)

% Set up for ascii communication, follow README discussion
writeline(s, "encode 1")
pause(0.1)
data = readline(s);

% Set up channel(s) to scan
writeline(s, "slist 0 0")
pause(0.1)

% Rate and other setup
writeline(s, "srate 800")
pause(0.1)
writeline(s, "dec 1")
pause(0.1)


% Flush the port buffer
flush(s)

% Start scanning
writeline(s, "start")
pause(0.1)

% Read data, follow README discussion
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