function storedPixels = parseimages(imageDir, BaseFilename, roiRegion, startFrame, endFrame, amplituideBoost)
% PARSEIMAGES Extracts selected ROI from image stack and outputs stack of average amplitude in ROI over time.
%   storedPixels = PARSEIMAGES(imageDir, BaseFilename, roiRegion, startFrame, nFrame, amplituideBoost)
fprintf('Extracting Image Data...\n')

prefix = BaseFilename.prefix;
increment = BaseFilename.changing_region;
suffix = BaseFilename.suffix;

oldDir = pwd;
cd(imageDir)

storedPixels = zeros(startFrame, endFrame);
if nargin == 5 % without argument for amplitude boost
    for i = startFrame-1:endFrame-1
        filename = joinfilename(i, prefix, increment, suffix);
        im = imread(filename, 'PixelRegion', roiRegion);
        storedPixels(i+1) = mean(mean(im));
    end
elseif nargin == 6 % with argument for amplitude boost
    fprintf('Adjusting Amplitude...\n')
    for i = startFrame-1:endFrame-1
        filename = joinfilename(i, prefix, increment, suffix);
        im = imread(filename, 'PixelRegion', roiRegion);
        storedPixels(i+1) = mean(mean(im)) + amplituideBoost;
    end
end
cd(oldDir)
end