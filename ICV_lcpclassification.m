function [] = ICV_lcpclassification(histogram1,histogramcar,histogramface)
%ICV_LCPCLASSIFICATION Summary of this function goes here
%   Detailed explanation goes here
m=size(histogram1,1);
value1=0;
value2=0;

%histogram intersection method
for i=1:m
    value1=value1+min(histogram1(i),histogramface(i));
    value2=value2+min(histogram1(i),histogramcar(i));
end
if value1>value2
    disp('face image')
else
    disp('non face-image')
end

end

