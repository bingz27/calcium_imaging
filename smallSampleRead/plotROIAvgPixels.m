clc
clear

%%% User Inputs
roi_start_1 = [745, 590]; %top left point of roi [x,y]
roi_start_2 = [760, 590];
roi_side_len = 15;
num_frames = 2000;
base_filename = Filename('img_', .000000001,'_Default_000.tif'); %based on camera image naming system
%%% User Inputs

roi_region_1 = setROI(roi_start_1, roi_side_len);
roi_region_2 = setROI(roi_start_2, roi_side_len);
stored_active = parseImages('C:\Users\Loturco\Desktop\Bing - Matlab Analysis\sample data\5msecglutamateprepost_1', base_filename, roi_region_1, num_frames);
stored_inactive = parseImages('C:\Users\Loturco\Desktop\Bing - Matlab Analysis\sample data\5msecglutamateprepost_1', base_filename, roi_region_2, num_frames, +185);

%im = markROI('C:\Users\Loturco\Desktop\Bing - Matlab Analysis\sample data\5msecglutamateprepost_1', roi_start_1, roi_side_len);
%show(im)

fprintf('Plotting Data...\n')
time = 1:num_frames;
plot(time, stored_active, 'm', time, stored_inactive, 'c')
fprintf('Done!\n')