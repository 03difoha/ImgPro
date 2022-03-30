function [] = fillTable(baseFileName, fullFileName, registered, resultMatrix)
    registeredName = './registeredImages/'+ string(baseFileName) ;
    imwrite(registered, registeredName)
    disp('<tr>')
    disp('<td>' + string(fullFileName)+ '</td>');
    disp('<td><img width="200" height="200" src="'+ string(fullFileName) +'"></td>');
    disp('<td><img width="200" height="200" src="'+ registeredName +'"></td>');
    disp('<td><table>')
    disp('<tr><td>' + strjoin(resultMatrix(1,:), ' ')+ '</td></tr>');
    disp('<tr><td>' + strjoin(resultMatrix(2,:), ' ')+ '</td></tr>');
    disp('<tr><td>' + strjoin(resultMatrix(3,:), ' ')+ '</td></tr>');
    disp('<tr><td>' + strjoin(resultMatrix(4,:), ' ')+ '</td></tr>');
    disp('</table></td>')
    disp('<td>true</td>');
    disp('</tr>')
end

