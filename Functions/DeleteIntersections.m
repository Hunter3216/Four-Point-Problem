%This function serves to remove points that create linear dependancies. In
%other words, if a point exists on the line between two other points, it
%gets removed.

function[PointMatrix] = DeleteIntersections(PointMatrix)
    Points = length(PointMatrix);
    
    
    if Points == 4
        VectorMatrix = GenerateVectorMatrix(PointMatrix, (VectorCombos(PointMatrix))); %Generates temporary VectorMatrix
        UnitVectorMatrix = zeros(6,2); %Pre allocates UnitVectorMatrix
        
        for x = 1 : 6 %Takes the unit vector of each vector and creates a new matrix
            UnitVectorMatrix(x,:) = VectorMatrix(x,:)/norm(VectorMatrix(x,:));
        end
        
        %case for if point 2 needs to be removed
        if (UnitVectorMatrix(1,:) == UnitVectorMatrix(2,:) & UnitVectorMatrix(1,:) == UnitVectorMatrix(4,:)) | (UnitVectorMatrix(1,:) == UnitVectorMatrix(3,:) & UnitVectorMatrix(1,:) == UnitVectorMatrix(5,:))
            uiwait(msgbox(['Point (' num2str(PointMatrix(2,1)) ',' num2str(PointMatrix(2,2)) ') was removed as it was linearly dependant'])) 
            PointMatrix(2,:) = [];
        
        %case for if point 3 needs to be removed. If points 2 and 3 need to
        %be removed, 2 is removed her and 3 is removed in the case for 3
        %points
        elseif (UnitVectorMatrix(2,:) == UnitVectorMatrix(3,:) & UnitVectorMatrix(2,:) == UnitVectorMatrix(6,:)) | (UnitVectorMatrix(4,:) == UnitVectorMatrix(5,:) & UnitVectorMatrix(4,:) == UnitVectorMatrix(6,:))    
            uiwait(msgbox(['Point (' num2str(PointMatrix(3,1)) ',' num2str(PointMatrix(3,2)) ') was removed as it was linearly dependant'])) 
            PointMatrix(3,:) = [];
        end
    end

    if length(PointMatrix) == 3 %Checks to see if point 2 needs to be removed
        VectorMatrix = GenerateVectorMatrix(PointMatrix, (VectorCombos(PointMatrix))); %Temporary VectorMatrix

        %checks to see if the unit vector are the same. If they are, point
        %two is removed
        if VectorMatrix(1,:)/norm(VectorMatrix(1,:)) == VectorMatrix(2,:)/norm(VectorMatrix(2,:))
           uiwait(msgbox(['Point (' num2str(PointMatrix(2,1)) ',' num2str(PointMatrix(2,2)) ') was removed as it was linearly dependant'])) 
           PointMatrix(2,:) = []; 
        end    
    end
end