function [finalred,finalgreen,finalblue,count] = ICV_histintersection(video)
%ICV_HISTINTERSECTION Summary of this function goes here
%   Detailed explanation goes here
ii = 1;
jj=1;
level=0:1:255;
% check if the video has a next frame
while hasFrame(video)
    
    %get te first frame T
    frame=readFrame(video);
    
    %get the second frame T+1
    frame1=readFrame(video);
    
    [x,y,z]=size(frame);
    
    %Initiallising RGB bins
    R=1:256;
    finalred=1:256;%to store the intersection value red of channel
    finalblue=1:256;%to store the intersection value of blue channel
    finalgreen=1:256;%to store the intersection value of greeen channel
    
    % to store pixel values of frame T in each channel
    G=0:255;
    B=0:255;
    rcount=0;
    bcount=0;
    gcount=0;
    
    % to store pixel values of fram t+1 in each channel
    
    R1=1:256;
    G1=0:255;
    B1=0:255;
    rcount1=0;
    bcount1=0;
    gcount1=0;
    
    
    for z=1:256
        for i = 1:x
            for j = 1:y
                if frame(i,j,1)==z-1
                    rcount=rcount+1;
                end
                if frame1(i,j,1)==z-1
                    rcount1=rcount1+1;
                end
                if frame(i,j,2)==z-1
                    gcount=gcount+1;
                end
                if frame1(i,j,2)==z-1
                    gcount1=gcount1+1;
                end
                if frame(i,j,3)==z-1
                    bcount=bcount+1;
                end
                if frame1(i,j,3)==z-1
                    bcount1=bcount1+1;
                end
            end
            
        end
        R(z)=rcount;
        R1(z)=rcount1;
        rcount=0;
        rcount1=0;
        G(z)=gcount;
        G1(z)=gcount1;
        gcount=0;
        gcount1=0;
        B(z)=bcount;
        B1(z)=bcount1;
        bcount=0;
        bcount1=0;
    end
    count=0;
    
    
    %getting intersection by geting the minimum value in the two channels
    
    for i=1:255
        finalred(i)=min(R(i),R1(i));
        count=count+finalred(i);
        
        if R1(i)==R(i)
            finalred(i)=R(i);
            count=count+R(i);
        end
        
        finalblue(i)=min(B(i),B1(i));
        count=count+finalblue(i);
        
        if B1(i)==B(i)
            finalblue(i)=B(i);
            count=count+B1(i);
        end
        
        finalgreen(i)=min(G(i),G1(i));
        count=count+finalgreen(i);
        
        if G1(i)==G(i)
            finalgreen(i)=G(i);
            count=count+G1(i);
            
        end
        
    end
    % display live histogram with each frame
    mov(ii) = im2frame(frame);
    ii = ii+1;
    subplot(1,5,1);
    imshow(frame);
    figure(1), subplot (1,5,2);
    bar(level,R,'Barwidth',1,'Facecolor',[1 0 0],'Edgecolor',[1 0 0]);
    hold on;
    
    bar(level,G,'Barwidth',1,'Facecolor',[0 1 0],'Edgecolor',[0 1 0]);
    hold on;
    
    bar(level,B,'Barwidth',1,'Facecolor',[0 0 1],'Edgecolor',[0 0 1]);
    hold off;
    axis tight;
    drawnow;
    mov(jj) = im2frame(frame1);
    jj = jj+1;
    subplot(1,5,3);
    imshow(frame1);
    figure(1), subplot (1,5,4);
    bar(level,R1,'Barwidth',1,'Facecolor',[1 0 0],'Edgecolor',[1 0 0]);
    hold on;
    
    bar(level,G1,'Barwidth',1,'Facecolor',[0 1 0],'Edgecolor',[0 1 0]);
    hold on;
    
    bar(level,B1,'Barwidth',1,'Facecolor',[0 0 1],'Edgecolor',[0 0 1]);
    hold off;
    axis tight;
    drawnow;
    
    
    figure(1), subplot (1,5,5);
    bar(level,finalred,'Barwidth',1,'Facecolor',[1 0 0],'Edgecolor',[1 0 0]);
    hold on;
    
    bar(level,finalgreen,'Barwidth',1,'Facecolor',[0 1 0],'Edgecolor',[0 1 0]);
    hold on;
    
    bar(level,finalblue,'Barwidth',1,'Facecolor',[0 0 1],'Edgecolor',[0 0 1]);
    hold off;
    axis tight;
    xlabel('intersecting pixels'); title(count)
    drawnow;
end



end


