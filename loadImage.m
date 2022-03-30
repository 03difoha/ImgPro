function [loaded] = loadImage(image)
    image = imread(image);
    loaded = im2double(image);
%     loaded = round(double(img)/255);
end