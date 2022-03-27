image=loadImage('images1/proj_4.png');

% circleCoordinates = findCircles(image); 
% disp(circleCoordinates)

rows=1;
cols=1;

I = imread("./images1/org_1.png");
fixedPoints = [26.5 26.5; 26.5 445.5; 445.5 26.5; 445.5  445.5];
myDir = fullfile('./1file'); 
imageNames = [];
imageThumbnails = [];

myFiles = dir(fullfile(myDir,'*.png'));
for k = 1:length(myFiles)
    filename = myFiles(k);
    baseFileName = myFiles(k).name;
    fullFileName = fullfile(myDir, baseFileName);
    filecontent = imread(fullFileName);
    imageNames = [imageNames; string(fullFileName)];
    image=loadImage(fullFileName);
    [centers,radii]= findCircles(image);
    Iblur1 = imgaussfilt(image,2);
    registered = correctImage(Iblur1, fixedPoints, centers, I);
    subplot(rows, cols, k)
    cropped = imcrop(registered,[70 70 339 339]);
%     339 so we can divide cleanly 340 into parts
%         cropped = imcrop(registered,[17.5 17.5 85 85]);

    C = mat2cell(cropped, [85 85 85 85],[85 85 85 85], [3]);
    disp(size(cropped))
    montage({image, cropped})
    title(fullFileName)
    viscircles(centers,radii);


%     I = registered;
%     R1 = I(1:64, 1:84);
%     R2 = I(1:64, 85:168);
%     R3 = I(65:128, 1:84);
%     R4 = I(65:128, 85:168);
%     R5 = I(129:192, 1:84);
%     R6 = I(129:192, 85:168);
%     imshow(R6);
%      squareCenters = [];
%       for k = 1:16
%           [x,y] = ginput(1);
%           disp([x,y])
%          squareSamples = [squareSamples; [x,y]];
%      end
%     disp(squareSamples)
 end




