%This function serves to take user input and turn it into a matrix where
%each row is a point of coordinates x and y

function[PointMatrix] = GeneratePointMatrix()
    
    RowsToRemove = []; %Creating variables for later use
    i = 1;
    PointMatrix = zeros(4,2);
    
    %Taking user input from 4 lines (1 point a line) and turning it to char
    InputMatrix = char(inputdlg({'What is point number 1?','What is point number 2?','What is point number 3?','What is point number 4?'},'s'));

    %Takes the characters from input to turn into a matrix of 4,2
    for x = 1 : 4
        try
            PointMatrix(x,:) = (reshape(str2num(char(strsplit(InputMatrix(x,:)))), 2, []))';
        catch
            RowsToRemove(i) = x + 1 - i; %catches rows with non number to be removed later
            i = i + 1;
        end
    end

    for x = 1 : length(RowsToRemove) %removes rows by going through RowsToRemove and deleting rows in PointMatrix
        PointMatrix(RowsToRemove(x),:) = [];
    end

    PointMatrix = unique(PointMatrix,'rows');
end