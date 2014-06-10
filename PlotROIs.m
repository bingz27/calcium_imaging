clc
clear

%%% User Inputs
roiStartArray = {};
for i = 1:3
    roiStartArray{i} = [740+10*(i-1), 590];
end
for i = 4:5
    roiStartArray{i} = [740+10*(i-1), 600];
end
roiSideLength = 30;
startFrame = 240;
endFrame = 340;
BaseFilename = Filename('img_', .000000001,'_Default_000.tif'); %based on camera image naming system
imageDirectory = 'C:\Users\Loturco\Desktop\Bing - Matlab Analysis\sample data\5msecglutamateprepost_1';
N = 100; % number of multivariate Gaussian (MVG) samples
DIM = 2; % MVG dimension
ICs = 5; % number of independent components (PC) to decompose into
%%% User Inputs

for i = 1:numel(roiStartArray)
    roiRegionArray{i} = setroi(roiStartArray{i}, roiSideLength);
    roiStored{i} = parseimages(imageDirectory, BaseFilename, roiRegionArray{i}, startFrame, endFrame);
end
markroi(imageDirectory, BaseFilename, roiSideLength, roiStored{1}, roiStored{2}, roiStored{3},roiStored{4}, roiStored{5});

figure
fprintf('Plotting Data...\n')
time = startFrame:endFrame;
%plot(time, storedActive)
numel(time)
numel(roiStored{1})
plot(time, roiStored{1}, time, roiStored{2}, time, roiStored{3}, time, roiStored{4}, time, roiStored{5})
fprintf('Done!\n')