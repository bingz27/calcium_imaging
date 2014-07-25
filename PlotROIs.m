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
imageDirectory = 'C:\Users\Loturco\Desktop\Bing - Matlab Analysis\data\2014.04.22 Camera_PCO 5msecglutamateprepost';
%%% User Inputs

%extract pixels from tiff movie based on set ROIs
roiRegionArray = cell(1, numel(roiStartArray));
roiStoredArray = cell(1, numel(roiStartArray));
for i = 1:numel(roiStartArray)
    roiRegionArray{i} = setroi(roiStartArray{i}, roiSideLength);
    roiStoredArray{i} = parseimages(imageDirectory, BaseFilename, roiRegionArray{i}, startFrame, endFrame);
end

%plot location of ROIs on the first frame of the movie
fprintf('Displaying ROI Locations...\n')
markroi(imageDirectory, BaseFilename, roiSideLength, roiStartArray);

%plot the fluorescence levels over time for each ROI
figure
fprintf('Plotting Data...\n')
time = (startFrame:endFrame)*0.1;
for i = 1:numel(roiStoredArray)
    plot(time,roiStoredArray{i})
    hold all
end
hold off

 %{
%pass through ICA filter
inputSignals = [roiStoredArray{1,:}];
nDimention = int8(numel(roiStartArray));
nDecomposition = 6;
myICADemo(inputSignals, nDimention, nDecomposition)
%}
fprintf('Done!\n')