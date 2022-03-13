function [centers] = findCircles(img)
    disp("running findCircles")
    [centers, radii] = imfindcircles(img,[10, 50], 'Sensitivity',0.8, 'ObjectPolarity','dark');
    imshow(img)
    viscircles(centers, radii,'Color','b');
end

