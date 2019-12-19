function [masterhistogram] = ICV_localbinarypattern(image)
%ICV_LOCALBINARYPATTERN Summary of this function goes here
%   Detailed explanation goes here
image= im2double(image);
% window size
rowwindow=64;
columnwindow=64;

m=size(image,1);
n=size(image,2);
%convert the image in blocks or window
Blocks = cell(m/rowwindow,n/columnwindow);
LBPBlocks = cell(m/rowwindow,n/columnwindow);
histogram=cell((m/rowwindow)*(n/columnwindow));
counti = 0;
rcount=0;
k=1;
R=1:256;
%converting the image in blocks
for i = 1:rowwindow:m-(rowwindow-1)
    counti = counti + 1;
    countj = 0;
    for j = 1:columnwindow:n-(columnwindow-1)
        countj = countj + 1;
        Blocks{counti,countj} = image(i:i+(rowwindow-1),j:j+(columnwindow-1));
    end
end
%performing LBP operation for each and every pixel in each and every block
for p=1:m/rowwindow
    for q=1:n/columnwindow
        image=Blocks{p,q};
        for i=2:size(image,1)-1
            for j=2:1:size(image,2)-1
                threshhold=image(i,j);
                img(i-1,j-1)=image(i-1,j-1)>=threshhold;
                img(i-1,j)=image(i-1,j)>=threshhold;
                img(i-1,j+1)=image(i-1,j+1)>=threshhold;
                img(i,j+1)=image(i,j+1)>=threshhold;
                img(i+1,j+1)=image(i+1,j+1)>=threshhold;
                img(i+1,j)=image(i+1,j)>=threshhold;
                img(i+1,j-1)=image(i+1,j-1)>=threshhold;
                img(i,j-1)=image(i,j-1)>=threshhold;
                s=img(i,j-1)*2^7+img(i+1,j-1)*2^6+img(i+1,j)*2^5+img(i+1,j+1)*2^4+img(i,j+1)*2^3+img(i-1,j+1)*2^2+img(i-1,j)*2^1+img(i-1,j-1)*2^0;
                new_image(i,j)=s;
                
            end
        end
        %storing the LBP block
        LBPBlocks{p,q}=uint8(new_image);
    end
end
%calculating the histogram of each LBP block
for p=1:1:m/rowwindow
    for q=1:1:n/columnwindow
        new_image=LBPBlocks{p,q};
        [o,b]=size(new_image);
        for z=1:256
            for i = 1:o
                for j = 1:b
                    if new_image(i,j)==z-1
                        rcount=rcount+1;
                    end
                end
                
                R(z)=rcount;
                rcount=0;
            end
            
        end
        histogram{k}=R;
        k=k+1;
    end
    
end

%concatenating the histograms to of each LBP block to get one master
%histogram

masterhistogram= [histogram{1}(:); histogram{2}(:);histogram{3}(:); histogram{4}(:);histogram{5}(:); histogram{6}(:);histogram{7}(:); histogram{8}(:);histogram{9}(:); histogram{10}(:);histogram{11}(:); histogram{12}(:);histogram{13}(:); histogram{14}(:);histogram{15}(:); histogram{16}(:)];

level=1:1:256;
figure;
subplot(1,3,1);
imshow(uint8(Blocks{1,3}));
subplot(1,3,2);
imshow(uint8(LBPBlocks{1,3}))
subplot(1,3,3)
bar(level,histogram{3}/sum(histogram{3}));


end





