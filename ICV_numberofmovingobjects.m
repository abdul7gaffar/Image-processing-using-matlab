function [] = ICV_numberofmovingobjects()
%ICV_NUMBEROFMOVINGOBJECTS Summary of this function goes here
%   Detailed explanation goes here
%create object called vision of the video
v=vision.VideoFileReader('C:\Users\user\Pictures\NewDatasetC.avi');

%to get blobs of minimum 5 pixels
blob =vision.BlobAnalysis('BoundingBoxOutputPort', true, ...
    'AreaOutputPort', true, 'CentroidOutputPort', true, ...
    'MinimumBlobArea', 5);

%to detect foreground
foreground= vision.ForegroundDetector('NumGaussians', 3, ...
    'NumTrainingFrames', 40, 'MinimumBackgroundRatio', 0.7);
i=1;
while ~isDone(v)
    %Get the next frame
    frame1 = v.step();
    %get the fore ground of the frame
    mask=foreground.step(frame1);
    
    
    % to remove noise fill holes and compute bounding boxes.
    mask = imopen(mask, strel('rectangle', [3,3]));
    mask = imclose(mask, strel('rectangle', [15, 15]));
    mask = imfill(mask, 'holes');
    
    % Perform blob analysis to find connected components.
    [~, ~, bbox] = blob.step(mask);
    
    % the number of cars found in the video frame
    movingobjs = size(bbox, 1);
    %store the number of moving objects in an array
    r(i)=movingobjs;
    %frame counter
    i=i+1;
    
end
% plot the number of moving objects per frame
level=1:1:i;
bar(i,r);
end

