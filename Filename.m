classdef Filename
    %holds a base filename that has a portion that changes by an increment
    properties
        prefix
        changing_region
        suffix
    end
    methods
        function instance = Filename(a,b,c)
            %constructor that loads values of object
            instance.prefix = a;
            instance.changing_region = b;
            instance.suffix = c;
        end
    end
end