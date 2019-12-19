function [rot_im] = ICV_rot_img(img_arg,theta)
%ROT_IMG Summary of this function goes here
%   Detailed explanation goes here
%using mid point method
[x1,x2,x3]= size(img_arg);

%theta=pi*theta/180;

%calculating array dimesions such that  rotated image gets fit in it exactly.
% we are using absolute so that we get  positve value in any case ie.,any quadrant.

new_row=ceil(x1*abs(cosd(theta))+x2*abs(sind(theta)));
new_col=ceil(x1*abs(sind(x2))+x2*abs(cosd(theta)));

rotated_image=uint8(zeros([new_row new_col 3 ]));

% get mid point of the axes so shift each pixel with it so that the image doesnt go out of the image after skew is performed

final_mid_point_x=ceil((size(rotated_image,1))/2);
final_mid_point_y=ceil((size(rotated_image,2))/2);
orignal_mid_point_x=ceil(x1/2);
orignal_mid_point_y=ceil(x2/2);


for i=1:size(rotated_image,1)
    for j=1:size(rotated_image,2)
        %the the new position of each pixel
        newx= round((i-final_mid_point_x)*cosd(theta)+(j-final_mid_point_y)*sind(theta))+orignal_mid_point_x;
        newy= round(-(i-final_mid_point_x)*sind(theta)+(j-final_mid_point_y)*cosd(theta))+orignal_mid_point_y;
        %check if the new positon is within the
        %dimensions of the image
        
        if (newx>=1 && newy>=1 && newx<=size(img_arg,1) &&  newy<=size(img_arg,2) )
            rotated_image(i,j,:)=img_arg(newx,newy,:);
        end
        
    end
end

rot_im=rotated_image;
rot_im=uint8(rot_im);



%{
using farthest point method
[x1,x2]=size(img_arg);
nx=0;
ny=0;
for m=1:x1
    for n=1:x2
        newx=ceil(m*cosd(theta)-(n)*sind(theta));
        newy=ceil(m*sind(theta)+(n)*cosd(theta));
        if nx>newx
            nx=newx;
        end
        if ny>newy
            ny=newy;
        end
        nx=ceil(nx*-1);
        ny=(ny*-1);
    end
end
new_image=zeros(x1+nx,x2+ny);
for i=1:x1
    rotatefor j=1:x2
        newx=ceil(i*cosd(theta)-(j)*sind(theta));
        newy=ceil(i*sind(theta)+(j)*cosd(theta));
        if ((newx >=1) && (newy>=1)&& newx<=size(new_image,2) && newy<=size(new_image,1))
            new_image(newx+nx,newy+ny)=img_arg(i,j);
        end
    end
end
rot_im=new_image;
rot_im=uint8(rot_im);
end
%}
end