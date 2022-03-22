image=loadImage('images1/proj_4.png');

% circleCoordinates = findCircles(image); 
% disp(circleCoordinates)


rows=6;
cols=5;


figure(1)


I = imread("./images1/org_1.png");
fixedPoints = [26.5 26.5; 26.5 445.5; 445.5 26.5; 445.5  445.5];

myDir = fullfile('./images1'); %gets directory

imageNames = [];
imageThumbnails = [];

 myFiles = dir(fullfile(myDir,'*.png'));
%  T=cell(n,1);
 for k = 1:length(myFiles)
     filename = myFiles(k);
  
  
     baseFileName = myFiles(k).name;
     fullFileName = fullfile(myDir, baseFileName);
     filecontent = imread(fullFileName);
%      T{k,1} = filecontent;
     
%      disp(fullFileName)
     imageNames = [imageNames; string(fullFileName)];
     image=loadImage(fullFileName);
     [centers,radii]= findCircles(image);
      disp(centers)
%      disp(size(centers))
%     Iblur1 = imgaussfilt(image,2);
     registered = correctImage(image, fixedPoints, centers, I);
     subplot(rows, cols, k)
%      imshow(registered)
     montage({image, registered})

     title(fullFileName)
%      disp(centers)
      viscircles(centers,radii);

     
 end

%  patients = table(imageNames, T);
%  disp(patients)





% subplot(2,1,1);
% plot(1:10);
% uitable('Data', T, 'ColumnName', {'Image Name', 'Thumbnail'}, 'Position', [20 20 500 150]);
