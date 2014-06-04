%% extractAverage.m
% version 2014.06.03
% extracts selected ROI from image stack and outputs stack of average amplitude in ROI over time
function stored_pixels = extractAverage(image_directory, roi_region, num_frames, amplituide_boost)
fprintf('Extracting Image Data...\n')
name_prefix = 'img_'; %based on camera image naming system
increment = .000000001;
name_suffix = '_Default_000.tif';

old_dir = pwd;
cd(image_directory)
stored_pixels = zeros(1, num_frames);
if nargin == 3
    for i = 0:num_frames-1
        c = i*increment;
        c = sprintf('%.9f', c); %change to string with nine decimal places
        c = c(3:length(c)); %remove the first two digits which are "0."
        file_name = strcat(name_prefix, c, name_suffix);
        %im = imread(file_name)
        im = imread(file_name, 'PixelRegion', roi_region);
        stored_pixels(i+1) = mean(mean(im));
    end
elseif nargin == 4
    for i = 0:num_frames-1
        c = i*increment;
        c = sprintf('%.9f', c); %change to string with nine decimal places
        c = c(3:length(c)); %remove the first two digits which are "0."
        file_name = strcat(name_prefix, c, name_suffix);
        %im = imread(file_name)
        im = imread(file_name, 'PixelRegion', roi_region);
        stored_pixels(i+1) = mean(mean(im)) + amplituide_boost;
    end
end
cd(old_dir)
end