image=loadImage('images1/proj_4.png');


% imshow(Iblur1)


circleCoordinates = findCircles(image);
% 
% disp(circleCoordinates)



% noisyRGB = imgaussfilt(image,1);


% disp(greenChannel)
% imshow(greenChannel)
% imshow(blueChannel)





% % Extract the individual red, green, and blue color channels.
% redChannel = noisyRGB(:, :, 1);
% greenChannel = noisyRGB(:, :, 2);
% blueChannel = noisyRGB(:, :, 3);
% 
% m = 3;
% n = m;
% 
% % Median Filter the channels:
% redMF = medfilt2(redChannel, [m n]);
% greenMF = medfilt2(greenChannel, [m n]);
% blueMF = medfilt2(blueChannel, [m n]);
% 
% % Find the noise in the red.
% noiseImage = (redChannel == 0 | redChannel == 255);
% % Get rid of the noise in the red by replacing with median.
% noiseFreeRed = redChannel;
% noiseFreeRed(noiseImage) = redMF(noiseImage);
% 
% % Find the noise in the green.
% noiseImage = (greenChannel == 0 | greenChannel == 255);
% % Get rid of the noise in the green by replacing with median.
% noiseFreeGreen = greenChannel;
% noiseFreeGreen(noiseImage) = greenMF(noiseImage);
% 
% % Find the noise in the blue.
% noiseImage = (blueChannel == 0 | blueChannel == 255);
% % Get rid of the noise in the blue by replacing with median.
% noiseFreeBlue = blueChannel;
% noiseFreeBlue(noiseImage) = blueMF(noiseImage);
% 
% 
% % Reconstruct the noise free RGB image
% rgbFixed = cat(3, noiseFreeRed, noiseFreeGreen, noiseFreeBlue);
% % imshow(rgbFixed);
% % sharp = imsharpen(rgbFixed);
% % imshow(sharp)
% title('Restored Image', 'FontSize', fontSize);
