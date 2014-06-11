clc
clear

%%% User Inputs
roiStartArray = cell(1,6); %preallocate cell array
for i = 1:3
    roiStartArray{i} = [740+10*(i-1), 590];
end
for i = 4:6
    roiStartArray{i} = [740+10*(i-4), 605];
end
roiSideLength = 30;
startFrame = 240;
endFrame = 340;
BaseFilename = Filename('img_', .000000001,'_Default_000.tif'); %based on camera image naming system
imageDirectory = 'C:\Users\Loturco\Desktop\Bing - Matlab Analysis\sample data\5msecglutamateprepost_1';
%%% User Inputs

%extract pixels from tiff movie based on set ROIs
roiRegionArray = cell(1, numel(roiStartArray));
roiStored = cell(1, numel(roiStartArray));
for i = 1:numel(roiStartArray)
    roiRegionArray{i} = setroi(roiStartArray{i}, roiSideLength);
    roiStored{i} = parseimages(imageDirectory, BaseFilename, roiRegionArray{i}, startFrame, endFrame);
end

%mark location of ROIs on the first frame of the movie
fprintf('Displaying ROI Locations...\n')
markroi(imageDirectory, BaseFilename, roiSideLength, roiStartArray);

%plot the fluorescence levels over time for each ROI
figure
fprintf('Plotting Data...\n')
time = startFrame:endFrame;
for i = 1:numel(roiStored)
    plot(time,roiStored{i})
    hold all
end
hold off

fprintf('Done!\n')