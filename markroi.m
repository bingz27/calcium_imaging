function markroi(varargin)
% MARKROI Draw outline of ROI onto brain image file.
%   markedImage = MARKROI(imageDirectory, Filename, roiStartArray)

imageDirectory = varargin{1};
oldDirectory = pwd;
cd(imageDirectory)

Filename = varargin{2};
filename = joinfilename(Filename.prefix, Filename.changing_region, Filename.suffix);
imgagePath = strcat(imageDirectory, '\', filename);
im = imread(imgagePath);
imshow(im, [])
axis off
hold on

roiSideLength = varargin{3};
for i = 1:numel(varargin{4}) %i = number of roiStart in roiStartArray
    rectangle('Position', [varargin{4}{i}(1), varargin{4}{i}(2), roiSideLength, roiSideLength], 'EdgeColor', 'g') %rectangle('Position', [x, y, w, h])
end

%{
f = getframe(gca);
[X, map] = frame2im(f);
imwrite(X, 'test.tiff');
%}
hold off
cd(oldDirectory)
end