function [resultMatrix] = findColours(image)
    palette.c001 = 'B';
    palette.c010 = 'G';
    palette.c100 = 'R';
    palette.c110 = 'Y';
    palette.c111 = 'W';

    image = imcrop(image,[70 70 339 339]);
    % crop to 339 so image length is a nice round 340    
    
    % double the saturation which gives a much better result
    hsv = rgb2hsv(image);
    hsv(:, :, 2) = hsv(:, :, 2) * 2;
    hsv(hsv > 1) = 1; 
    image = hsv2rgb(hsv);

    % our image is a 4x4 grid so 340 / 4 = 85
    % we choose to ignore the white borders between squares since we should
    % get enough colour pixels for this to be irrelevant
    cell = mat2cell(image, [85 85 85 85],[85 85 85 85], [1, 1, 1]);
    cRows = 4;
    cCols = 4;
    resultMatrix = zeros(4,4);
    resultMatrix = string(resultMatrix);
    % create an empty matrix of strings     
    for k=1:cRows
        for l=1:cCols
            % loop through columns and rows
            R = round(median(cell{k, l, 1}, 'all'));
            G = round(median(cell{k, l, 2}, 'all'));
            B = round(median(cell{k, l, 3}, 'all'));
            RGB = [R,G,B];
            % create an RGB triplet based off rounded values of each channel            
            RGB = string(RGB);
            RGB = ['c' RGB];
            rgbString = strjoin(string(RGB), '');
            resultMatrix(k, l) = palette.(rgbString);
            % use the triplet to index into our pallete object             
            RGB = [];
            % empty our triplet for the next iteration
        end
    end
end

