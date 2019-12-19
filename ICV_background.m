function [image] = ICV_background(v)
%ICV_MOVINGOBJECTS Summary of this function goes here
%   Detailed explanation goes here

%create background from first 50 frames
%the higher the number the better the background
nTest=50;
n = size(readFrame(v), 3);
t = linspace(0, v.Duration-1/v.FrameRate , nTest);
%bufferspace for first fifty frames
b = NaN([v.Height, v.Width, n, nTest]);
for fg = 1:nTest
    v.CurrentTime =t(fg);
    % reading current frame and updating background
    %getting the mode from the current frame
    b(:, :, :, mod(fg, nTest) + 1) = readFrame(v);
end
%applying median function on the finalbackground image to get a clear
%background

image = nanmedian(b, 4);
end




