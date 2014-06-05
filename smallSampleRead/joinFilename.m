function filename = joinfilename(varargin)
% JOINFILENAME Joints parts of an individual filename.
%   filename = JOINFILENAME(count, name_prefix, name_increment, name_suffix)
%   filename = JOINFILENAME(name_prefix, name_increment, name_suffix)
if nargin == 4
    count = varargin{1};
    name_prefix = varargin{2};
    name_increment = varargin{3};
    name_suffix = varargin{4};
    i = count*name_increment;
    i = sprintf('%.9f', i); %change to string with nine decimal places
    i = i(3:length(i)); %remove the first two digits which are "0."
    filename = strcat(name_prefix, i, name_suffix);
elseif nargin == 3
    name_prefix = varargin{1};
    name_increment = varargin{2};
    name_suffix = varargin{3};
    i = sprintf('%.9f', name_increment);
    i = i(3:length(i));
    filename = strcat(name_prefix, i, name_suffix);
end