function storedPixels = parseimages(imageDirectory, BaseFilename, roiRegion, startFrame, endFrame, amplituideBoost)
% PARSEIMAGES Extracts selected ROI from image stack and outputs stack of average amplitude in ROI over time.
%   storedPixels = PARSEIMAGES(imageDir, BaseFilename, roiRegion, startFrame, nFrame, amplituideBoost)
fprintf('Extracting Image Data...\n')

prefix = BaseFilename.prefix;
increment = BaseFilename.changing_region;
suffix = BaseFilename.suffix;

oldDirectory = pwd;
cd(imageDirectory)

storedPixels = zeros(1, endFrame-startFrame+1);
if nargin == 5 % without argument for amplitude boost
    j = 1;
    for i = startFrame-1:endFrame-1
        filename = joinfilename(i, prefix, increment, suffix);
        im = imread(filename, 'PixelRegion', roiRegion);
        storedPixels(j) = mean(mean(im));
        j = j + 1;
    end
elseif nargin == 6 % with argument for amplitude boost
    fprintf('Adjusting Amplitude...\n')
    j = 1;
    for i = startFrame-1:endFrame-1
        filename = joinfilename(i, prefix, increment, suffix);
        im = imread(filename, 'PixelRegion', roiRegion);
        storedPixels(j) = mean(mean(im)) + amplituideBoost;
        j = j + 1;
    end
end
cd(oldDirectory)
end