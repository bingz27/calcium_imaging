function stored_pixels = parseimages(image_dir, base_filename, roi_region, num_frames, amplituide_boost)
% PARSEIMAGES Extracts selected ROI from image stack and outputs stack of average amplitude in ROI over time.
%   storedPixels = PARSEIMAGES(image_dir, base_filename, roi_region, num_frames, amplituide_boost)
%   TODO: allow user to set start 
fprintf('Extracting Image Data...\n')
prefix = base_filename.prefix;
increment = base_filename.changing_region;
suffix = base_filename.suffix;

old_dir = pwd;
cd(image_dir)

stored_pixels = zeros(1, num_frames);
if nargin == 4 % without argument for amplitude boost
    for i = 0:num_frames-1
        filename = joinFilename(i, prefix, increment, suffix);
        im = imread(filename, 'PixelRegion', roi_region);
        stored_pixels(i+1) = mean(mean(im));
    end
elseif nargin == 5 % with argument for amplitude boost
    fprintf('Adjusting Amplitude...\n')
    for i = 0:num_frames-1
        filename = joinFilename(i, prefix, increment, suffix);
        im = imread(filename, 'PixelRegion', roi_region);
        stored_pixels(i+1) = mean(mean(im)) + amplituide_boost;
    end
end
cd(old_dir)
end