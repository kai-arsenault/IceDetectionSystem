function update_livehistogram_display(obj,event,hImage)
% This callback function updates the displayed frame and the histogram.
% Copyright 2007-2017 The MathWorks, Inc.
% Display the current image frame.
set(hImage, 'CData', event.Data);
% Select the second subplot on the figure for the histogram.
subplot(1,2,2);
% Plot the histogram. Choose 128 bins for faster update of the display.
imhist(event.Data, 128);
%pixelValue is a 255x2 matrix; column one is the bin location and column two is
%the number of pixels in the bin
[dataArray, binLocation] = imhist(event.Data);
pixelValue = [binLocation, dataArray];
%calculates the amount of black pixels in the frame
blackPixel = 0;
for i = 1:70
    blackPixel = blackPixel + pixelValue(i,2);
end
%%calculates the total pixels in the frame
totalPixel = 0;
for i = 1:255
    totalPixel = totalPixel + pixelValue(i,2);
end
percentBlack = (blackPixel/totalPixel)*100;
if  percentBlack >= 40
    a = arduino();
    %writeDigitalPin(a,'D13',1);
    clear a
end
% Refresh the display.
drawnow