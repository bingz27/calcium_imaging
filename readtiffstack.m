function [FinalImage, runTime] = readtiffstack(imageDirectory, imageName)

oldDirectory = pwd;
cd(imageDirectory)
tic();

FileTif=imageName;
InfoImage=imfinfo(FileTif);
mImage=InfoImage(1).Width;
nImage=InfoImage(1).Height;
NumberImages=length(InfoImage);
FinalImage=zeros(nImage,mImage,NumberImages,'uint16');
 
TifLink = Tiff(FileTif, 'r');
for i=1:NumberImages
   TifLink.setDirectory(i);
   FinalImage(:,:,i)=TifLink.read();
end
TifLink.close();

runTime = toc();
cd(oldDirectory)
end