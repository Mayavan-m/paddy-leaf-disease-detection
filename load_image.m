% load_image.m - image acquisition (excerpt from the MATLAB GUI callback)
% Lets the user pick a paddy leaf photo and shows it in the GUI.

% browse the image into the system
[filename1, pathname1] = uigetfile({'*.jpg';'*.gif';'*.bmp';'*.*'}, 'Please pick the paddy sample');
global imageSelected; global sameImage;
imageSelected = strcat(pathname1, filename1);
sameImage     = strcat(pathname1, filename1);
axes(handles.originalaxes); imshow(imageSelected);
guidata(hObject, handles);
