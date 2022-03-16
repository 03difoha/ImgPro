image=loadImage('images1/proj_4.png');

% circleCoordinates = findCircles(image); 
% disp(circleCoordinates)


rows=6;
cols=5;


figure(1)


myDir = fullfile('./images1'); %gets directory


 myFiles = dir(fullfile(myDir,'*.png'));
 for k = 1:length(myFiles)
     baseFileName = myFiles(k).name;
     fullFileName = fullfile(myDir, baseFileName);
     disp(fullFileName)
     image=loadImage(fullFileName);
     [centers,radii]= findCircles(image);
      subplot(rows, cols, k)
      imshow(image)
      disp(circleCoordinates)
      viscircles(centers,radii);
 end