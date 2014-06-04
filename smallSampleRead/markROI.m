%% markROI.m
% version 2014.06.04
% 
function marked_image = markROI(varargin)
old_dir = pwd;
cd(varargin{1})
% TODO process odd and even inputs different
%for varargin{1:nargin}
%marked_image = 
cd(old_dir)
end

%{
EXAMPLE
function plotWithTitle(varargin)
if rem(nargin,2) ~= 0
    myTitle = varargin{nargin};
    numPlotInputs = nargin - 1;
else
    myTitle = 'Default Title';
    numPlotInputs = nargin;
end

plot(varargin{1:numPlotInputs})
title(myTitle)
%}