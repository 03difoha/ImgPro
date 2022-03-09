function [loaded] = loadImage(img)
    img = imread(img);
    loaded = round(double(img)/255);
end