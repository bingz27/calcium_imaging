function markroi(varargin)
% MARKROI Draw outline of ROI onto brain image file.
%   markedImage = MARKROI(image_dir, Filename, roi_start1, roi_side_len1...roi_startN, roi_side_lenN)

imgDir = varargin{1};
oldDir = pwd;
cd(imgDir)

Filename = varargin{2};
filename = joinfilename(Filename.prefix, Filename.changing_region, Filename.suffix);
img_path = strcat(imgDir, '\', filename);
im = imread(img_path);
imshow(im, [])
axis off
hold on

roiSideLength = varargin{3};
for i = 1:numel(varargin{4}) %i = number of roiStart in roiStartArray
    rectangle('Position', [varargin{4}{i}(1), varargin{4}{i}(2), roiSideLength, roiSideLength], 'EdgeColor', 'g') %rectangle('Position', [x, y, w, h])
end
    
f = getframe(gca);
[X, map] = frame2im(f);

%imwrite(X, 'test.tiff');
cd(oldDir)
end