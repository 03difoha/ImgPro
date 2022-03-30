function [centers, radii] = findCircles(img)
%      [centers, radii] = imfindcircles(img,[10, 50], 'Sensitivity',0.8, 'ObjectPolarity','dark');
%      imshow(img)
%      viscircles(centers, radii,'Color','b');
    Iblur1 = imgaussfilt(img,2);
    BW = im2bw(Iblur1,0.1);
    inverted = imcomplement(BW);
    stats = regionprops('table',inverted,'Centroid','MajorAxisLength','MinorAxisLength');
    centers = stats.Centroid;
    
end

