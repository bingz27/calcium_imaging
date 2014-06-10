clc
clear

%%% User Inputs
roiStart1 = [745, 590]; %top left point of roi [x,y]
%roiStart2 = [760, 590];
roiSideLength = 15;
nFrame = 100;
BaseFilename = Filename('img_', .000000001,'_Default_000.tif'); %based on camera image naming system
imageDirectory = 'C:\Users\Loturco\Desktop\Bing - Matlab Analysis\sample data\5msecglutamateprepost_1';
N = 100; % number of multivariate Gaussian (MVG) samples
DIM = 2; % MVG dimension
ICs = 5; % number of independent components (PC) to decompose into
%%% User Inputs

roiRegion1 = setroi(roiStart1, roiSideLength);
%roiRegion2 = setroi(roiStart2, roiSideLength);
storedActive = parseimages(imageDirectory, BaseFilename, roiRegion1, nFrame);
%storedInactive = parseimages(imageDirectory, BaseFilename, roiRegion2, nFrame, +185);
%markroi(imageDirectory, BaseFilename, roiStart1, roiSideLength);

figure
fprintf('Plotting Data...\n')
time = 1:nFrame;
plot(time, storedActive, 'c', time, storedInactive, 'm')
fprintf('Done!\n')