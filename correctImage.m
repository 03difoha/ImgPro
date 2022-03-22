function [Jregistered] = correctImage(image, fixedPoints, movingPoints, I)
     if size(fixedPoints) == size(movingPoints)
         tform = fitgeotrans(movingPoints,fixedPoints,'projective');
         Jregistered = imwarp(image,tform,'OutputView',imref2d(size(I)));
     else
        Jregistered = image;
     end
end




