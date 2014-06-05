clc
clear

%%% User Inputs
roi_start_1 = [745, 590]; %top left point of roi [x,y]
roi_start_2 = [760, 590];
roi_side_len = 15;
num_frames = 2000;
BaseFilename = Filename('img_', .000000001,'_Default_000.tif'); %based on camera image naming system
%%% User Inputs
markROI('C:\Users\Loturco\Desktop\Bing - Matlab Analysis\sample data\5msecglutamateprepost_1', BaseFilename, roi_start_1, roi_side_len, roi_start_2, roi_side_len);

fprintf('Done!\n')

%{
figure

load clown

imagesc(X)
colormap(map)
axis off

hold on

rectangle('position',[50 30 70 30])

f=getframe(gca)
[X, map] = frame2im(f);

imwrite(X,'test.jpg','jpeg')
%}