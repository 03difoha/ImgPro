function [centers] = findCircles(img)
    disp("running findCircles")
    [centers, radii] = imfindcircles(img,[10, 50], 'Sensitivity',0.9, 'ObjectPolarity','dark');
    viscircles(centers, radii,'Color','b');
end

