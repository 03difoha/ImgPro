function [registered, output] = colourMatrix(fullFileName)
    image=loadImage(fullFileName);
    centers= findCircles(image);
    registered = correctImage(image, centers);
    output = findColours(registered);
end

