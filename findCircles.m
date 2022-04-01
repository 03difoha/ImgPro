function [centers] = findCircles(img)
    blurred = imgaussfilt(img,2);
    % blur to smooth out noise
    BW = im2bw(blurred,0.1);
    % convert to black and white with threshold to isolate circles
    inverted = imcomplement(BW);
    stats = regionprops('table',inverted,'Centroid','MajorAxisLength','MinorAxisLength');
    centers = stats.Centroid;
    % detect centers of the detected elements
end

