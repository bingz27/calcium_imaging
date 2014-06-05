function roi_region = setROI(roi_start, roi_side_len)
% SETROI Creates a grid ROI value with start and end x and y coordinates.
% roiRegion = SETROI(roi_start, roi_side_len)
fprintf('Creating ROI...\n')
roi_rows = [roi_start(2), roi_start(2) + roi_side_len];
roi_cols = [roi_start(1), roi_start(1) + roi_side_len];
roi_region = {roi_rows, roi_cols}; %#rows = y coord, #cols = x coord
end