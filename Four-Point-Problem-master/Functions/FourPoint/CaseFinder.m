function[Case] = CaseFinder(PointMatrix, VectorMatrix, PointVsVectorMatrix)
    %Oh man, here we go.
    
    if (PointMatrix(1,2) < PointMatrix(2,2)) & (PointMatrix(1,2) < PointMatrix(4,2)) & (PointMatrix(3,2) < PointMatrix(2,2)) & (PointMatrix(3,2) < PointMatrix(4,2)) & ~(PointVsVectorMatrix(3,3)) & (PointVsVectorMatrix(2,3))
        Case = 1;
    elseif (PointMatrix(1,2) > PointMatrix(2,2)) & (PointMatrix(1,2) > PointMatrix(4,2)) & (PointMatrix(3,2) > PointMatrix(2,2)) & (PointMatrix(3,2) > PointMatrix(4,2)) & ~(PointVsVectorMatrix(2,3)) & (PointVsVectorMatrix(3,3))
        Case = 2;
    elseif (PointMatrix(1,2) > PointMatrix(2,2)) & (PointMatrix(1,2) > PointMatrix(3,2)) & (PointMatrix(4,2) > PointMatrix(2,2)) & (PointMatrix(4,2) > PointMatrix(3,2)) & ~(PointVsVectorMatrix(2,2)) & ~(PointVsVectorMatrix(3,3)) & (PointVsVectorMatrix(1,5)) & ~(PointVsVectorMatrix(3,5))
        Case = 3;
    elseif (PointMatrix(1,2) < PointMatrix(2,2)) & (PointMatrix(1,2) < PointMatrix(3,2)) & (PointMatrix(4,2) < PointMatrix(2,2)) & (PointMatrix(4,2) < PointMatrix(3,2)) & (PointVsVectorMatrix(2,2)) & (PointVsVectorMatrix(3,5))
        Case = 4;
    elseif (PointMatrix(3,2) < PointMatrix(2,2)) & ~(PointVsVectorMatrix(3,1)) & ~(PointVsVectorMatrix(3,5)) & (PointVsVectorMatrix(3,3))
        Case = 5;
    elseif (PointVsVectorMatrix(3,1)) & (PointVsVectorMatrix(3,5)) & ~(PointVsVectorMatrix(3,3)) & (PointMatrix(3,2) > PointMatrix(2,2))
        Case = 6;
    elseif (PointVsVectorMatrix(2,3)) & ~(PointVsVectorMatrix(2,2)) & ~(PointVsVectorMatrix(2,6)) & (PointMatrix(2,2) < PointMatrix(3,2))
        Case = 7;
    elseif (PointVsVectorMatrix(2,2)) & (PointVsVectorMatrix(2,6)) & ~(PointVsVectorMatrix(2,3)) & (PointMatrix(2,2) > PointMatrix(3,2))
        Case = 8;
    elseif (PointVsVectorMatrix(2,3)) & ~(PointVsVectorMatrix(3,3))
        Case = 9;
    elseif (PointVsVectorMatrix(3,3)) & ~(PointVsVectorMatrix(2,3))
        Case = 10;
    else
        uiwait(msgbox('I''m sorry'))
    end
    
    
    
    
end