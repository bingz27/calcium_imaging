%% Capture: frame where data is taken
% ROI: resulting image when capture frame is scaled down
% Unit: each unit of the final scaled ROI

clc
clear

%%% User Inputs
name_prefix = 'img_';
increment = .000000001;
name_suffix = '_Default_000.tif';
capture_start = [735, 575]; %top left point of roi [x,y]
capture_side_len = 30;
capture_divisions = 9; %since 30 is divisible by sqrt(9)
capture_frame_quantity = 2000;
%%% User Inputs

capture_region = setROI(capture_start, capture_side_len);

fprintf('Extracting Image Data...\n')
cd('C:\Users\Loturco\Documents\MATLAB\trialtiff')
roi_side_len = sqrt(capture_divisions);
stored = zeros(roi_side_len, roi_side_len, capture_frame_quantity);
for i = 0:capture_frame_quantity-1
    c = i*increment;
    c = sprintf('%.9f', c); %change to string with nine decimal places
    c = c(3:length(c)); %remove the first two digits which are "0."
    file_name = strcat(name_prefix, c, name_suffix);
    im = imread(file_name, 'PixelRegion', capture_region);
    unit_x = 1;
    unit_y = 1;
    unit_side_len = capture_side_len/roi_side_len;
    for x = 1:3
        for y = 1:3
            stored(x,y,i+1) = mean(mean(im(unit_x:unit_x+9, unit_y:unit_y+9)));
            stored(x,y,i+1)
            unit_y = unit_y + 10
        end
        unit_x = unit_x + 10
    end
end

fprintf('Plotting Data...\n')
time = 1:capture_frame_quantity;
plot(time, stored(1,1), time, stored(1,2), time, stored(1,3), time, stored(2,1), time, stored(2,2), time, stored(2,3), time, stored(3,1), time, stored(3,2), time, stored(3,3))