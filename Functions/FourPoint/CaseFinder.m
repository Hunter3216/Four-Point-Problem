function[Case CrossedPoints] = CaseFinder(PointMatrix, VectorMatrix, PointVsVectorMatrix)
    %Oh man, here we go.
    CrossedPoints = [];
    
    if (PointMatrix(1,2) < PointMatrix(2,2)) & (PointMatrix(1,2) < PointMatrix(4,2)) & (PointMatrix(3,2) < PointMatrix(2,2)) & (PointMatrix(3,2) < PointMatrix(4,2)) & ~(PointVsVectorMatrix(3,3)) & (PointVsVectorMatrix(2,3))
        Case = [1 1 0 0 1 1; 1 0 1 1 0 1; 0 1 1 1 1 0];
        CrossedPoints = [PointMatrix(1,:); PointMatrix(4,:);PointMatrix(2,:);PointMatrix(3,:)];
    
    elseif (PointMatrix(1,2) > PointMatrix(2,2)) & (PointMatrix(1,2) > PointMatrix(4,2)) & (PointMatrix(3,2) > PointMatrix(2,2)) & (PointMatrix(3,2) > PointMatrix(4,2)) & ~(PointVsVectorMatrix(2,3)) & (PointVsVectorMatrix(3,3))
        Case = [1 1 0 0 1 1; 1 0 1 1 0 1; 0 1 1 1 1 0];
        CrossedPoints = [PointMatrix(2,:); PointMatrix(3,:);PointMatrix(1,:);PointMatrix(4,:)];
    
    elseif (PointMatrix(1,2) > PointMatrix(2,2)) & (PointMatrix(1,2) > PointMatrix(3,2)) & (PointMatrix(4,2) > PointMatrix(2,2)) & (PointMatrix(4,2) > PointMatrix(3,2)) & ~(PointVsVectorMatrix(2,2)) & ~(PointVsVectorMatrix(3,3)) & (PointVsVectorMatrix(1,5)) & ~(PointVsVectorMatrix(3,5))
        Case = [1 0 1 1 0 1; 1 1 0 0 1 1; 0 1 1 1 1 0];
        CrossedPoints = [PointMatrix(2,:); PointMatrix(4,:);PointMatrix(1,:);PointMatrix(3,:)];
    
    elseif (PointMatrix(1,2) < PointMatrix(2,2)) & (PointMatrix(1,2) < PointMatrix(3,2)) & (PointMatrix(4,2) < PointMatrix(2,2)) & (PointMatrix(4,2) < PointMatrix(3,2)) & (PointVsVectorMatrix(2,2)) & (PointVsVectorMatrix(3,5))
        Case = [1 0 1 1 0 1; 1 1 0 0 1 1; 0 1 1 1 1 0];
        CrossedPoints = [PointMatrix(1,:); PointMatrix(3,:);PointMatrix(2,:);PointMatrix(4,:)];
   
    elseif (PointMatrix(3,2) < PointMatrix(2,2)) & ~(PointVsVectorMatrix(3,1)) & ~(PointVsVectorMatrix(3,5)) & (PointVsVectorMatrix(3,3))
        Case = [1 1 0 0 1 1; 1 0 1 1 0 1; 0 1 1 1 1 0];
    
    elseif (PointVsVectorMatrix(3,1)) & (PointVsVectorMatrix(3,5)) & ~(PointVsVectorMatrix(3,3)) & (PointMatrix(3,2) > PointMatrix(2,2))
        Case = [1 1 0 0 1 1; 1 0 1 1 0 1; 0 1 1 1 1 0];
    
    elseif (PointVsVectorMatrix(2,3)) & ~(PointVsVectorMatrix(2,2)) & ~(PointVsVectorMatrix(2,6)) & (PointMatrix(2,2) < PointMatrix(3,2))
        Case = [1 1 0 0 1 1; 1 0 1 1 0 1; 0 1 1 1 1 0]; %I could turn these recurring ifs into or comparisons but fuck it. Here we are.
    
    elseif (PointVsVectorMatrix(2,2)) & (PointVsVectorMatrix(2,6)) & ~(PointVsVectorMatrix(2,3)) & (PointMatrix(2,2) > PointMatrix(3,2))
        Case = [1 1 0 0 1 1; 1 0 1 1 0 1; 0 1 1 1 1 0];
    
    elseif (PointVsVectorMatrix(2,3)) & ~(PointVsVectorMatrix(3,3))
        Case = [1 1 0 0 1 1; 1 0 1 1 0 1; 0 1 1 1 1 0];
        CrossedPoints = [PointMatrix(1,:); PointMatrix(4,:);PointMatrix(2,:);PointMatrix(3,:)];
    
    elseif (PointVsVectorMatrix(3,3)) & ~(PointVsVectorMatrix(2,3))
        Case = [1 1 0 0 1 1; 1 0 1 1 0 1; 0 1 1 1 1 0];
        CrossedPoints = [PointMatrix(1,:); PointMatrix(4,:);PointMatrix(2,:);PointMatrix(3,:)];
    
    else
        uiwait(msgbox('I''m sorry'))
    end
    
    
    
    
end