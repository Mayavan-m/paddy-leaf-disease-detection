% preprocess.m - pre-processing (excerpt from the MATLAB GUI callbacks)
% Step 1: convert the leaf image to grayscale.
% Step 2: remove noise with an average filter.

global imageSelected;
global sameImage;

% convert to grayscale image
Z = imread(sameImage);
G = rgb2gray(Z);
axes(handles.grayscaleaxes); imshow(G);

% filtering (average filter, symmetric borders)
h = fspecial('average');
F = imfilter(G, h, 'symmetric');
axes(handles.filtering); imshow(F);
