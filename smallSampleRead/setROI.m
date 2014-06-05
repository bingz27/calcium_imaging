function roiRegion = setroi(roiStart, roiSideLength)
% SETROI Creates a grid ROI value with start and end x and y coordinates.
% roiRegion = SETROI(roi_start, roi_side_len)
fprintf('Creating ROI...\n')
roiRows = [roiStart(2), roiStart(2) + roiSideLength];
roiCols = [roiStart(1), roiStart(1) + roiSideLength];
roiRegion = {roiRows, roiCols}; %#rows = y coord, #cols = x coord
end