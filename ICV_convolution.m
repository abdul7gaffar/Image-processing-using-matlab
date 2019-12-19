function [convoluted_image] = ICV_convolution(image,kernel)
%ICV_CONVOLUTION Summary of this function goes here
%   Detailed explanation goes here


[x,y]=size(image);
% create new image with dame dimensions to store filtereed pixel values
new_image=zeros(size(image),'uint8');

[x1,x2]=size(kernel);
%calculate sum of kernel for average filtering
ksum=0;
for i=1:x1
for j=1:x2
    ksum=ksum+kernel(i,j);
end
end
%if its not an edge detection or sharpening filter
if (ksum>1)
kernel=kernel*(1/ksum);
end

%calculate traversing of loop based on kernel size only for 3x3,5x5,7x7
%sized kernels
if x1==3
    r=2;
    s=x-1;
    f=y-1;
    
end
if x1==5
    r=4;
    s=x-3;
    f=y-3;
    
end
if x1==7
    r=6;
    s=x-5;
    f=y-5;
    
end

    for n=r:s
        for m=r:f
            sum=0;
            for kx=1:size(kernel,1)
                for ky=1:size(kernel,2)
                    %multipply corresponding values of kernel with the
                    %image and get the sum
                    sum= sum + image(n-kx+2,m-ky+2,:)*kernel(kx,ky);
                end
            end
            %assign the calculated sum in the correspondin mid point coordinate of image
            new_image(n,m,:)=sum;
        end
        
    end
    
    convoluted_image=uint8(new_image);
    
end
