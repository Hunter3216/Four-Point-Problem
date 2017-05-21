function[PointMatrix] = GeneratePointMatrix

    RowsToRemove = [];
    i = 1;
    PointMatrix = zeros(4,2);
    InputMatrix = char(inputdlg({'What is point number 1?','What is point number 2?','What is point number 3?','What is point number 4?'},'s'));

    for x = 1 : 4
        try
            PointMatrix(x,:) = (reshape(str2num(char(strsplit(InputMatrix(x,:)))), 2, []))';
        catch
            RowsToRemove(i) = x + 1 - i;
            i = i + 1;
        end
    end

    for x = 1 : length(RowsToRemove)
        PointMatrix(RowsToRemove(x),:) = [];
    end

    PointMatrix = unique(PointMatrix,'rows');

end