function filename = joinfilename(varargin)
% JOINFILENAME Joints parts of an individual filename.
%   filename = JOINFILENAME(count, name_prefix, name_increment, name_suffix)
%   filename = JOINFILENAME(name_prefix, name_increment, name_suffix)
if nargin == 4
    count = varargin{1};
    namePrefix = varargin{2};
    nameIncrement = varargin{3};
    nameSuffix = varargin{4};
    i = count*nameIncrement;
    i = sprintf('%.9f', i); %change to string with nine decimal places
    i = i(3:length(i)); %remove the first two digits which are "0."
    filename = strcat(namePrefix, i, nameSuffix);
elseif nargin == 3
    namePrefix = varargin{1};
    nameIncrement = varargin{2};
    nameSuffix = varargin{3};
    i = sprintf('%.9f', nameIncrement);
    i = i(3:length(i));
    filename = strcat(namePrefix, i, nameSuffix);
end