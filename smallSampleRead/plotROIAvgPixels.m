clc
clear

%%% User Inputs
roiStart1 = [745, 590]; %top left point of roi [x,y]
roiStart2 = [760, 590];
roiSideLength = 15;
nFrame = 2000;
BaseFilename = Filename('img_', .000000001,'_Default_000.tif'); %based on camera image naming system
%%% User Inputs

roiRegion1 = setroi(roiStart1, roiSideLength);
roiRegion2 = setroi(roiStart2, roiSideLength);
storedActive = parseimages('C:\Users\Loturco\Desktop\Bing - Matlab Analysis\sample data\5msecglutamateprepost_1', BaseFilename, roiRegion1, nFrame);
storedInactive = parseimages('C:\Users\Loturco\Desktop\Bing - Matlab Analysis\sample data\5msecglutamateprepost_1', BaseFilename, roiRegion2, nFrame, +185);
markroi('C:\Users\Loturco\Desktop\Bing - Matlab Analysis\sample data\5msecglutamateprepost_1', BaseFilename, roiStart1, roiSideLength, roiStart2, roiSideLength);

fprintf('Plotting Data...\n')
time = 1:nFrame;
plot(time, storedActive, 'm', time, storedInactive, 'c')
fprintf('Done!\n')