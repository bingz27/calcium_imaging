function markroi(varargin)
% MARKROI Draw outline of ROI onto brain image file.
%   markedImage = MARKROI(image_dir, Filename, roi_start1, roi_side_len1...roi_startN, roi_side_lenN)

img_dir = varargin{1};
old_dir = pwd;
cd(img_dir)

Filename = varargin{2};
%filename = joinFilename(Filename.prefix, Filename.changing_region, Filename.suffix);
img_path = strcat(img_dir, '5msecglutamateprepost_1.tif')
im = imread(img_path);
imshow(im, [])
%{
[X, map] = imread(img_path);
imagesc(X)
colormap(map)

axis off
hold on

for i = 3:2:nargin-1
    rectangle('Position', [varargin{i}(1), varargin{i}(2), varargin{i+1}, varargin{i+1}]) %rectangle('Position', [x, y, w, h])
end

f = getframe(gca);
[X, map] = frame2im(f);

imwrite(X, 'test.tiff');
cd(old_dir)
%}
end