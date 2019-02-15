function T = outsuThresh4e(f)
%OUTSUTHRESH4E Summary of this function goes here
%   Detailed explanation goes here
    I = imread(f); 
    counts = imhist(I,32); 
    T = otsuthresh(counts);
end

