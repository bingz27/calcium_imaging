function averagedImage = meanimagestack(imageDirectory, filename)
% MEANTIFFSTACK Creates single-frame image with average pixel values from a Tiff stack.
% averagedImage = meantiffstack(imageDirectory, filename)
%
oldDirectory = pwd;
cd(imageDirectory)

fprintf('Loading parameters...\n')
infoImage=imfinfo(filename);
nCol=infoImage(1).Width;
nRow=infoImage(1).Height;
nImage=length(infoImage);
finalImage=zeros(nRow,nCol,'double');

fprintf('Calculating average...\n')
for i = 1:nImage
    finalImage = finalImage + double(imread(filename, 'Index', i, 'Info', infoImage));
end

fprintf('Converting image...\n')
averagedImage = uint16(finalImage/nImage);

cd(oldDirectory)
end