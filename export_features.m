% export_features.m - turn the binary leaf image into a feature vector (excerpt)
% The binary image is resized to 1 x 240 values (0/1) and saved as CSV,
% which is then used as input to the neural network.

Row1 = 1;
Column1 = 240;
new = imresize(new, [Row1 Column1]);
new = new';                                  % take transpose

% get the full path of this .m file and build the output CSV path
p = mfilename('fullpath');
[pathStr, excelFile, ext] = fileparts(p);
newExcelFile = strcat(pathStr, '\ConvertedData\', 'csvData.csv');

% write the 0/1 data to a CSV file
dlmwrite(newExcelFile, new, 'delimiter', ',');
