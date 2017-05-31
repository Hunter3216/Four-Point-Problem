%Magic! Do not touch!
%To sum it up, this finds the vectors and points to plot for each of the
%three shapes that can be made from each of the 10 cases.
%Sean, if you're reading this, turn back now. Go check out some of the nice
%documentation found in the parts dealing with points 0 to 3


function[ShapeVectorMatrix, ShapePointMatrix] = CaseDoer(CaseVectorMatrix, PointMatrix,VectorMatrix)
    ShapeVectorMatrix = zeros(4,2,3);
    ShapePointMatrix = zeros(4,2,3,2);
    
    for i = 1 : 3
        ShapeVectorMatrixRow = 1;
        for k = 1 : 6
            if CaseVectorMatrix(i,k)
                ShapeVectorMatrix(ShapeVectorMatrixRow,:,i) = VectorMatrix(k,:);
                ShapeVectorMatrixRow = 1 + ShapeVectorMatrixRow;
            end
        end
    end
    
    for z = 1 : 3
        l = 0;
        j = 1;
        m = 1;
        
        for i = 1 : 3
            
            j = j + 1;
            for k = j : 4
                
                l = l + 1;
                
                if CaseVectorMatrix(z,l)
                    ShapePointMatrix(m,:,z,1) = PointMatrix(i,:);
                    ShapePointMatrix(m,:,z,2) = PointMatrix(k,:);
                    m = m + 1;
                end
            end
        end
    end
end