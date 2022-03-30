function [registered, output] = colourMatrix(fullFileName)
    image=loadImage(fullFileName);
    centers= findCircles(image);
    image = imgaussfilt(image,2);
    registered = correctImage(image, centers);
    output = findColours(registered);
end

