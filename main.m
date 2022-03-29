
fixedPoints = [26.5 26.5; 26.5 445.5; 445.5 26.5; 445.5  445.5];
myDir = fullfile('./images1'); 
imageNames = [];
output = [];
disp('<head><link rel="stylesheet" href="style.css"></head>')
disp('<table>')
disp('<tr><th>Filename</th> <th>Image</th> <th>Registered Image <th>Output</th>  <th>Success</th>  <th>Notes</th></tr>')

I = imread("./images1/org_1.png");
myFiles = dir(fullfile(myDir,'*.png'));
for k = 1:length(myFiles)
    
    filename = myFiles(k);
    baseFileName = myFiles(k).name;
    fullFileName = fullfile(myDir, baseFileName);
    filecontent = imread(fullFileName);
    imageNames = [imageNames; string(fullFileName)];
    image=loadImage(fullFileName);
    [centers,radii]= findCircles(image);
%     if ~ centers
%         disp(fullFileName)
%     end
   
% boost saturation *2 being ky number
HSV = rgb2hsv(image);

HSV(:, :, 2) = HSV(:, :, 2) * 2;

HSV(HSV > 1) = 1; 
image = hsv2rgb(HSV);


      image = imgaussfilt(image,2);
     registered = correctImage(image, fixedPoints, centers, I);
     resultMatrix = findColours(registered);
     output = [output; join(resultMatrix)];
     registeredName = './registeredImages/'+ string(baseFileName) ;
     imwrite(registered, registeredName)

%    disp(resultMatrix)
     disp('<tr>')
     disp('<td>' + string(fullFileName)+ '</td>');
     disp('<td><img width="200" height="200" src="'+ string(fullFileName) +'"></td>');
     disp('<td><img width="200" height="200" src="'+ registeredName +'"></td>');
     disp('<td><table>')
     disp('<tr><td>' + strjoin(resultMatrix(1,:), ' ')+ '</td></tr>');
     disp('<tr><td>' + strjoin(resultMatrix(2,:), ' ')+ '</td></tr>');
     disp('<tr><td>' + strjoin(resultMatrix(3,:), ' ')+ '</td></tr>');
     disp('<tr><td>' + strjoin(resultMatrix(4,:), ' ')+ '</td></tr>');
     disp('</table></td>')
     disp('<td>true</td>');
     disp('</tr>')


 end

disp('</table>')

