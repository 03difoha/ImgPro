function [resultMatrix] = findColours(image)

palette.c000 = 'Bl';
palette.c001 = 'B';
palette.c011 = 'B';
% actually Cyan
palette.c010 = 'G';
palette.c101 = 'R'; 
% actually Magenta
palette.c100 = 'R';
palette.c111 = 'W';
palette.c110 = 'Y';



cropped = imcrop(image,[70 70 339 339]);




%     339 so we can divide cleanly 340 into parts
    C = mat2cell(cropped, [85 85 85 85],[85 85 85 85], [1, 1, 1]);
    cRows = 4;
    cCols = 4;
    channels = 3;
    resultMatrix = zeros(4,4);
    resultMatrix = string(resultMatrix);
    for i =1:cRows
        for j = 1:cCols
            RGB = [round(median(C{i, j, 1}, 'all')), round(median(C{i, j, 2}, 'all')), round(median(C{i, j, 3}, 'all'))];
            RGB = string(RGB);
            RGB = ['c' RGB];
            rgbString = strjoin(string(RGB), '');
            resultMatrix(i, j) = palette.(rgbString);
            RGB = [];
        end
    end
end

