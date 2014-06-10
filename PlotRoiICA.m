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

time = 1:nFrame;
%--------------------------------------------------------------------------
% Perform PCA
%--------------------------------------------------------------------------
z = [storedActive; time]
[z_ic A T mean_z] = myICA(z,ICs);
z_LD = T \ pinv(A) * z_ic + repmat(mean_z,1,size(z,2)); % Low-dimensional approximation of z
z_ic_cov = cov(z_ic') %#ok
%--------------------------------------------------------------------------

%{
%--------------------------------------------------------------------------
% Compute variance/residual data
%--------------------------------------------------------------------------
vars = diag(cov(z')); % Variance of each element of z
resids = zeros(DIM,1);
for i = 1:DIM
    resids(i) = norm(z(i,:) - z_LD(i,:));
end
%--------------------------------------------------------------------------
%}

%--------------------------------------------------------------------------
% Plot results
%--------------------------------------------------------------------------
figure
for i = 1:ICs
    subplot(ICs,1,i)
    plot(z_ic(i,:),'b')
    grid on
    ylabel(['z_{ic}_' num2str(i)])
end
subplot(ICs,1,1)
title([num2str(ICs) ' Independent Components of z (Centered and Normalized)'])

figure
for i = 1:DIM
    subplot(DIM,1,i)
    r = plot(z(i,:),'--r');
    hold on
    b = plot(z_LD(i,:),'-.b');
    grid on
    %xlabel(['Var(' num2str(i) ') = ' num2str(vars(i)) ' - Resid(' num2str(i) ') = ' num2str(resids(i))])
    ylabel(['z_' num2str(i)])
end
subplot(DIM,1,1)
title([num2str(ICs) '-Dimensional ICA Decomposition of ' num2str(DIM) '-Dimensional Data z'])
legend([r,b],'Actual z',[num2str(ICs) '-D ICA Approximation of z'])
%--------------------------------------------------------------------------