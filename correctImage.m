function [corrected] = correctImage(image, movingPoints)
    I = imread("./images1/org_1.png");
    fixedPoints = [26.5 26.5; 26.5 445.5; 445.5 26.5; 445.5  445.5];
    % normal coordinates for circles in unwarped image
    if size(fixedPoints) == size(movingPoints)
        tform = fitgeotrans(movingPoints,fixedPoints,'projective');
        % get a transformation object by comparing the two sets of points
        % best results were achieved using the projective transformation type        
        corrected = imwarp(image,tform,'OutputView',imref2d(size(I)));
        % correct the image by applying the geometric transform
    else
        corrected = image;
        % registration failed due to the moving points not being detected
        % so we default back to the original
    end
end




