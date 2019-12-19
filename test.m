clear all;clc;5
close all;
%{
%-----------question 1-------------------


% read image for skew and rotate
imag=imread('1abdul.jpg');
rotImg3=ICV_rot_img(imag,30);
rotImg6=ICV_rot_img(imag,60);
rotImg12=ICV_rot_img(imag,120);
rotImg5=ICV_rot_img(imag,-50);

skewImg1=ICV_skew(imag,10);
skewImg4=ICV_skew(imag,40);
skewImg6=ICV_skew(imag,60);

rot2skew5=ICV_rot_img(imag,20);
rot2skew5=ICV_skew(rot2skew5,50);

skew2rot5=ICV_skew(imag,50);
skew2rot5=ICV_rot_img(skew2rot5,20);
figure;
subplot(1,5,1);
title('orignal image');
imshow(imag);

subplot(1,5,2);
title('30 deg');
imshow(rotImg3);

subplot(1,5,3);
title('60 deg');
imshow(rotImg6);

subplot(1,5,4);
title('120 deg');
imshow(rotImg12);

subplot(1,5,5);
title('-50 deg');
imshow(rotImg5)
figure;
subplot(2,3,1);
title('10 deg');
imshow(skewImg1)

subplot(2,3,2);
title('40 deg');
imshow(skewImg4)

subplot(2,3,3);
title('60 deg');
imshow(skewImg6)
figure;
subplot(3,2,1);
title('rot+skew1');
imshow(rot2skew5);

subplot(3,2,2);
title('rot+skew');
imshow(skew2rot5);
%----------END OF QUESTION 1-----------------------
%}
%-------QUESTION 2-------------
%{
%convert image in gray scale to perform convolution
%reading an image
figue=imread('car-1.jpg');
figue=double(ICV_rgbtograyscale(figue));

kernel3a=[1,2,1;2,4,2;1,2,1];
kernel3b=[0,1,0;1,-4,1;0,1,0];

con3a = ICV_convolution(figue,kernel3a);
con3b=ICV_convolution(figue,kernel3b);

kernel5a=[1,1,2,1,1;1,1,2,1,1;2,2,4,2,2;1,1,2,1,1;1,1,2,1,1];
kernel5b=[0,0,1,0,0;0,0,1,0,0;1,1,-8,1,1;0,0,1,0,0;0,0,1,0,0];

con5a = ICV_convolution(figue,kernel5a);
con5b=ICV_convolution(figue,kernel5b);

kernel7a=[1,1,1,2,1,1,1;1,1,1,2,1,1,1;1,1,1,2,1,1,1;2,2,2,4,2,2,2;1,1,1,2,1,1,1;1,1,1,2,1,1,1;1,1,1,2,1,1,1];
kernel7b=[0,0,0,1,0,0,0;0,0,0,1,0,0,0;0,0,0,1,0,0,0;1,1,1,-12,1,1,1;0,0,0,1,0,0,0;0,0,0,1,0,0,0;0,0,0,1,0,0,0];

con7a = ICV_convolution(figue,kernel7a);
con7b=ICV_convolution(figue,kernel7b);

figure;
subplot(1,2,1);
imshow(con3a);
subplot(1,2,2);
imshow(con3b);

figure;
subplot(2,2,1);
imshow(con5a);
subplot(2,2,2);
imshow(con5b);

figure;
subplot(3,2,1);
imshow(con7a);
subplot(3,2,2);
imshow(con7b);
%}
%----------end of question 2-------------
%-----question 3(a)------------------
%-------- video histogram--------

%{
if true
  v = VideoReader('DatasetB.avi');
  ii = 1;
 level=0:1:255;
  while hasFrame(v)
      count=0;
  f= readFrame(v);
  mov(ii) = im2frame(f);
  ii = ii+1;
  figure(1),subplot (1,2,1)
  imshow (f)
  [red,green,blue] = ICV_rgbhistogram(f); % Get histogram of red channel.
  figure(1), subplot (1,2,2);
    bar(level,red,'Barwidth',1,'Facecolor',[1 0 0],'Edgecolor',[1 0 0]);
     hold on;

   bar(level,green,'Barwidth',1,'Facecolor',[0 1 0],'Edgecolor',[0 1 0]);
    hold on;
 
  bar(level,blue,'Barwidth',1,'Facecolor',[0 0 1],'Edgecolor',[0 0 1]);
    hold off;
    axis tight;
  drawnow;
end
end

%}
%-----------question 3 (b)----------------
%{
video=VideoReader('DatasetB.avi');
ICV_histintersection(video);
%}

  %----------end of question 3---------------------------


