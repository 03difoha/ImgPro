function [resultMatrix] = findColours(image)
    palette.c001 = 'B';
    palette.c010 = 'G';
    palette.c100 = 'R';
    palette.c110 = 'Y';
    palette.c111 = 'W';

    image = imcrop(image,[70 70 339 339]);
    % If we crop to 339 then the resulting image length is a nice round 340    
    
    %     Here we double the saturation which gives a much better result
    hsv = rgb2hsv(image);
    hsv(:, :, 2) = hsv(:, :, 2) * 2;

    hsv(hsv > 1) = 1; 
    image = hsv2rgb(hsv);

    %     our image is a 4x4 grid so 340 / 4 = 85
    %     we choose to ignore the white borders between squares since we should
    %     get enough colour pixels for this to be irrelevant
    cell = mat2cell(image, [85 85 85 85],[85 85 85 85], [1, 1, 1]);
    cRows = 4;
    cCols = 4;
    resultMatrix = zeros(4,4);
    resultMatrix = string(resultMatrix);
    % Create an empty matrix of strings     
    for i =1:cRows
        for j = 1:cCols
            % Loop through columns and rows             
            RGB = [round(median(cell{i, j, 1}, 'all')), round(median(cell{i, j, 2}, 'all')), round(median(cell{i, j, 3}, 'all'))];
            % create an RGB triplet based off rounded values of each channel            
            RGB = string(RGB);
            RGB = ['c' RGB];
            rgbString = strjoin(string(RGB), '');
            resultMatrix(i, j) = palette.(rgbString);
            % Use the triplet to index into our pallete object             
            RGB = [];
            % empty our triplet for the next iteration
        end
    end
end

