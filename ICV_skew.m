function [skew_im] = ICV_skew(img_arg,theta) 
%SKEW Summary of this function goes here
%   Detailed explanation goes here
[x1,x2]= size(img_arg);
%covert degrees in radiance
theta=2*pi*theta/360;

% shearing factor of x axis
shx=0;

% shearing fcator of y axis
shy=1/tan(theta);

%to calculate the size of new image
% we are using absolute so that we get  positve value in any case ie.,any quadrant.
new_row=ceil(x1*abs(cosd(theta))+x2*abs(sind(theta)));                      
new_col=ceil(x1*abs(sind(x2))+x2*abs(cosd(theta)));                     

% create new image with new dimensions to store the skewed image values
skewed_image=uint8(zeros([new_row new_col 3 ]));
% get mid point of y axis so shift each pixel with it so that the image doesnt go out of the image after skew is performed                                                           
orignal_mid_point_y=ceil(x2/2);

for i=1:size(skewed_image,1)
    for j=1:size(skewed_image,2)                                                       

        %the the new position of each pixel
         newx= round(i+(shx*j));
         newy=round((shy*i)+j)-orignal_mid_point_y;
         
                                 %check if the new positon is within the
                                 %dimensions of the image
        if (newx>=1 && newy>=1 && newx<=size(img_arg,1) &&  newy<=size(img_arg,2) ) 
              skewed_image(i,j,:)=img_arg(newx,newy,:);  
         end

    end
end

skew_im=skewed_image;
skew_im=uint8(skew_im);

%{
theta=90-theta;
[x1,x2]=size(img_arg)
new_image=zeros(x1*2,x2*2,3)
nx=0;
for m=1:x1
    for n=1:x2
        newx=ceil(m+(n/tand(theta)));
       
        if nx>newx
            nx=newx
        end
    end
end
nx=nx*-1;
for i=1:x1
    for j=1:x2
        newx=ceil(i+(j/tand(theta)));
        newy=j;
          
         if (newx>=1 && newy>=1 && newx<=size(img_arg,1) &&  newy<=size(img_arg,2) )
   new_image(i,j,:)=img_arg(newx+nx,newy,:);
        end
    end
end
skew_im=new_image
    skew_im=uint8(skew_im);
    imshow(skew_im);
end

%}