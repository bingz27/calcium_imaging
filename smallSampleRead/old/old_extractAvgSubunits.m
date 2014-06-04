%% extractAvgSubunits.m
% version 2014.06.04
% 
function stored_pixels = extractAvgSubunits(image_directory, capture_region, num_frames, capture_divisions)
fprintf('Extracting Image Data...\n')
name_prefix = 'img_';
increment = .000000001;
name_suffix = '_Default_000.tif';

old_dir = pwd;
cd(image_directory)

roi_side_num = sqrt(capture_divisions);
stored = zeros(roi_side_num, roi_side_num, num_frames);
for i = 0:num_frames-1
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
cd(old_dir)
end