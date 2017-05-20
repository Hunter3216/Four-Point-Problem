PointMatrix = [3 5; 1 5; -9 1; 1 5];

if size(PointMatrix,2) ~= 2
    disp('You messed up somehow.')
end

if PointMatrix(1,:) == PointMatrix(2,:)
    disp('true')
end

if size(PointMatrix,1) == 4
    
end

for x = 1 : VectorCombos(PointMatrix)
    