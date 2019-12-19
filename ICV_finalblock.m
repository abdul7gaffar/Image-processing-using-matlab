function [vectors,imageComp] = ICV_finalblock(frame1,frame2,blocksize,searchparam)
%ICV_FINALBLOCK Summary of this function goes here
%   Detailed explanation goes here
[row,col]=size(frame1);
searchparam=searchparam/2;

%blockcount and vectors are used for storing the displacement founf od each
%block

blockcount=1;
vectors=zeros(2,(row*col)/(blocksize*blocksize));

for sr=1:blocksize:(row-(blocksize-1))
    
    for sc=1:blocksize:(col-(blocksize-1))
        
        
        %gets the each block from frame t-1
        img1=frame1(sr:(sr+(blocksize-1)),sc:(sc+(blocksize-1)));
        
        %flag is used to check if the we have moved on to the next block
        flag=0;
        
        %defines the search window length according to blocksize
        if sr-searchparam>1
            k=sr-searchparam;
        else
            k=sr;
        end
        if sc-searchparam>1
            l=sc-searchparam;
        else
            l=sc;
        end
        if k+searchparam+blocksize<(size(img1,1)-blocksize)
            check1=k+searchparam+blocksize;
        else
            check1=row-blocksize;
        end
        if l+searchparam+blocksize<(size(img1,1)-blocksize)
            check2=l+searchparam+blocksize;
        else
            check2=col-blocksize;
        end
        
        
        for i=k:(check1-1)
            for j=l:(check2-1)
                
                %defines the search window
                img2=frame2(i:i+blocksize-1,j:j+blocksize-1);
                
                %get the MAD
                mad=ICV_mad(img1,img2,blocksize);
                
                %check if its the first time for the block? if yes first
                %mad will be min if not else will get executed
                if flag==0
                    min=mad;
                    newx=i;
                    newy=j;
                    flag=1;
                else
                    if mad<min
                        min=mad;
                        newx=i;
                        newy=j;
                        flag=1;
                        
                    end
                end
            end
        end
        
        %storing the displavement along x and y axis
        vectors(1,blockcount)=newx-sr;
        vectors(2,blockcount)=newy-sc;
        
        %increment the blockcouter 
        blockcount=blockcount+1;
        
    end
end
count=1;
% applying motion vectors on the image to predict the next image
for i = 1:blocksize:row-blocksize+1
    for j = 1:blocksize:col-blocksize+1
        
        
        
        dy = vectors(1,count);
        dx = vectors(2,count);
        Verticalmotion = i + dy;
        Horizontalmotion = j + dx;
        imageComp(i:i+blocksize-1,j:j+blocksize-1) = frame1(Verticalmotion:Verticalmotion+blocksize-1, Horizontalmotion:Horizontalmotion+blocksize-1);
        count = count + 1;
        
    end
end


end


