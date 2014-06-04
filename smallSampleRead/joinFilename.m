%% joinFilename.m
% version 2014.06.04
% joints parts of an individual filename
function filename = joinFilename(count, name_prefix, name_increment, name_suffix)
i = count*name_increment;
i = sprintf('%.9f', i); %change to string with nine decimal places
i = i(3:length(i)); %remove the first two digits which are "0."
filename = strcat(name_prefix, i, name_suffix);
end