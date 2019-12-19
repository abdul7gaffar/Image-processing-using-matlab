function [mad] = ICV_mad(block1,block2,blocksize)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

error = 0;
for i = 1:blocksize
    for j = 1:blocksize
        error = error + abs((block1(i,j) - block2(i,j)));
    end
end
mad = error / (blocksize^2);
end

