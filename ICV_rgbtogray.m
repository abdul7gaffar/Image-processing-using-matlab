function [grayscale] = ICV_rgbtogray(img_arg)
%ICV_RGBTOGRAY Summary of this function goes here
%   Detailed explanation goes here
[x,y,~]=size(img_arg);
grayscale = zeros(x,y);
for i=1:x
    for j=1:y
        
        
        
            grayscale(i,j)=((0.299 * img_arg(i,j)) + (0.587 *img_arg(i,j)) + (0.1140 * img_arg(i,j)));
       
    end
end

grayscale=uint8(grayscale);


end
