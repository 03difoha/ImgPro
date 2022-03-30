myDir = fullfile('./images1'); 
% openTable() 
% openTable, fillTable, closeTable used for formatting results

myFiles = dir(fullfile(myDir,'*.png'));
for k = 1:length(myFiles)
    filename = myFiles(k);
    baseFileName = myFiles(k).name;
    fullFileName = fullfile(myDir, baseFileName);
    [registeredImage, output] = colourMatrix(fullFileName);
    fillTable(baseFileName, fullFileName, registeredImage, output)
 end

% closeTable()


