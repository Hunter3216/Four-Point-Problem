%This function serves to take the PointMatrix and turn it into a matrix of
%vectors. It will create all the possible vectors for the given points (0
%to 4 unique points)


function[VectorMatrix] = GenerateVectorMatrix(PointMatrix)
    VectorMatrix = zeros(VectorCombos(PointMatrix),2);
    VectorMatrixRow = 1; %Defining and variables for later use
    NumberOfPoints = size(PointMatrix,1);

    %These nested for loops create vectors in this order of points: 2-1 3-1 4-1 3-2
    %4-2 4-3
    for Subtrahend = 1 : NumberOfPoints-1

        Minuend = 1 + Subtrahend;

        for x = Minuend : NumberOfPoints
            VectorMatrix(VectorMatrixRow,:) = PointMatrix(Minuend,:)-PointMatrix(Subtrahend,:);   

            VectorMatrixRow = VectorMatrixRow + 1;
            Minuend = Minuend + 1;
        end
    end
end