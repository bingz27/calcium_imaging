clc
clear

%%% User Inputs
roi_start_active = [590, 745]; %top left point of roi [x,y]
%roi_start_inactive = [590, 655];
roi_start_inactive = [590, 165];
roi_side_len = 15;
num_frames = 2000;
%%% User Inputs
roi_region_active = setROI(roi_start_active, roi_side_len);
roi_region_inactive = setROI(roi_start_inactive, roi_side_len);
stored_active = extractAverage('C:\Users\Loturco\Documents\MATLAB\trialtiff',roi_region_active, num_frames);
stored_inactive = extractAverage('C:\Users\Loturco\Documents\MATLAB\trialtiff',roi_region_inactive, num_frames, +260);

fprintf('Plotting Data...\n')
time = 1:num_frames;
plot(time, stored_active, 'm', time, stored_inactive, 'c')