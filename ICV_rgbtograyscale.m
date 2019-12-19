function grayscale = ICV_rgbtograyscale(img_arg)
%RGBTOGRAYSCALE Summary of this function goes here
%   Detailed explanation goes here

red= img_arg(:,:,1);
green= img_arg(:,:,2);
blue= img_arg(:,:,3);
img_arg=(0.2989 * red + 0.5870 * green + 0.1140 * blue)
%{
for i=1:1:166
  for j=1:1:166
     
          
          if img2(i,j)<1
              
              img1(i,j)=0;
          end
      end
end
%}


grayscale=img_arg;
grayscale=uint8(grayscale);


end

