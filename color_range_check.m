% color_range_check.m - RGB range analysis (excerpt)
% Checks whether the pixel colours fall in the RGB range measured for a
% healthy (normal) paddy leaf.

img   = imread(inputImage);
Red   = img(:,:,1);
Green = img(:,:,2);
Blue  = img(:,:,3);

if (Red(:) >= 93 & Red(:) <= 204 & Green(:) >= 142 & Green(:) <= 210 & Blue(:) >= 64 & Blue(:) <= 155)
    result = 'Type 4 : Normal';
end
