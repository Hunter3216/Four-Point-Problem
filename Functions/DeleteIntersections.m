%This function serves to remove points that create linear dependancies. In
%other words, if a point exists on the line between two other points, it
%gets removed.

function[PointMatrix] = DeleteIntersections(PointMatrix)
    Points = length(PointMatrix);
    
    if Points > 2 %this 'if' is so that time isn't wasted generating a temporary vector matrix if one isn't needed
        VectorMatrix = GenerateVectorMatrix(PointMatrix, (VectorCombos(PointMatrix)));
        
        if Points == 3
            if (VectorMatrix(1,:) + VectorMatrix(2,:)) == (VectorMatrix(3,:)) | (VectorMatrix(1,:) + VectorMatrix(3,:)) == VectorMatrix(2,:) | (VectorMatrix(2,:) + VectorMatrix(3,:)) == VectorMatrix(1,:)
               uiwait(msgbox(['Point (' num2str(PointMatrix(2,1)) ',' num2str(PointMatrix(2,2)) ') was removed as it was linearly dependant'])) 
               PointMatrix(2,:) = []; 
            end
            
            
        elseif Points == 4
            
        end
    
    end
    
end