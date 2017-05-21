%This function serves to find the number of combinations of vectors from a
%set of points

function[Combos] = VectorCombos(PointMatrix)
    Combos = 0;
    n = size(PointMatrix,1) -1;
    for i = 1 : n
        Combos = Combos+i;
    end
end

%Creates number based off of Trangular Number Sequence
