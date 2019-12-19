function [image] = ICV_movingobjects(frame1,frame2)
%ICV_MOVINGOBJECTS Summary of this function goes here
%   Detailed explanation goes here

frame1=double(ICV_rgbtogray(frame1));
frame2=double(ICV_rgbtogray(frame2));
%performing pixel by pixel frame differencing
for i=1:size(frame1,1)
    for j=1:size(frame1,2)
        
        frame1(i,j)=abs(frame1(i,j)-frame2(i,j));
        
    end
end

image=double(frame1);
imshow(uint8(image));
%applying threshold
for i=1:size(image,1)
    for j=1:size(image,2)
        if image(i,j)>20
            image(i,j)=255;
        else
            image(i,j)=0;
            
        end
    end

imshow(uint8(image));
end


