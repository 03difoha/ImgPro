function [Jregistered] = correctImage(image, fixedPoints, movingPoints, I)
%  fixedPoints = [26.5 26.5; 26.5 445.5; 445.5  445.5; 445.5 26.5 ];
    warped = false;
    disp(movingPoints)
    for i = 1:size(movingPoints,1)
        xWarped = (movingPoints(i,1) - 26.5 >= 3) | (movingPoints(i,1) - 445.5 >= 3) ;
        yWarped = (movingPoints(i,2) - 26.5 >= 3) | (movingPoints(i,2) - 445.5 >= 3) ;
        if (logical(xWarped) & logical(yWarped))
            warped = true;
        end
    end

    if size(fixedPoints) == size(movingPoints) & warped
        tform = fitgeotrans(movingPoints,fixedPoints,'projective');
        Jregistered = imwarp(image,tform,'OutputView',imref2d(size(I)));
    else
        Jregistered = image;
    end
        disp(warped)
        disp('----------------')
end




