function [Jregistered] = correctImage(image, movingPoints)
    I = imread("./images1/org_1.png");
    fixedPoints = [26.5 26.5; 26.5 445.5; 445.5 26.5; 445.5  445.5];
    if size(fixedPoints) == size(movingPoints)
        tform = fitgeotrans(movingPoints,fixedPoints,'projective');
        Jregistered = imwarp(image,tform,'OutputView',imref2d(size(I)));
    else
        Jregistered = image;
%         registration failed due to the moving points not being detected
    end
end




