function [loaded] = loadImage(img)
    img = imread(img);
         loaded = im2double(img);

%     loaded = round(double(img)/255);
end