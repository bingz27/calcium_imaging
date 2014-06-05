function storedPixels = parseimages(imageDir, BaseFilename, roiRegion, nFrames, amplituideBoost)
% PARSEIMAGES Extracts selected ROI from image stack and outputs stack of average amplitude in ROI over time.
%   storedPixels = PARSEIMAGES(image_dir, base_filename, roi_region, num_frames, amplituide_boost)
%   TODO: allow user to set start 
fprintf('Extracting Image Data...\n')
prefix = BaseFilename.prefix;
increment = BaseFilename.changing_region;
suffix = BaseFilename.suffix;

oldDir = pwd;
cd(imageDir)

storedPixels = zeros(1, nFrames);
if nargin == 4 % without argument for amplitude boost
    for i = 0:nFrames-1
        filename = joinfilename(i, prefix, increment, suffix);
        im = imread(filename, 'PixelRegion', roiRegion);
        storedPixels(i+1) = mean(mean(im));
    end
elseif nargin == 5 % with argument for amplitude boost
    fprintf('Adjusting Amplitude...\n')
    for i = 0:nFrames-1
        filename = joinfilename(i, prefix, increment, suffix);
        im = imread(filename, 'PixelRegion', roiRegion);
        storedPixels(i+1) = mean(mean(im)) + amplituideBoost;
    end
end
cd(oldDir)
end