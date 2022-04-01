function [loaded] = loadImage(image)
    image = imread(image);
    loaded = im2double(image);
end




