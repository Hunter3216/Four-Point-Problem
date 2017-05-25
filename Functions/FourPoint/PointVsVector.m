%This function compares each of the 4 points to each of the 4 lines to see
%if the point is above or below the line. 


function[PointVsVectorMatrix] = PointVsVector(PointMatrix, VectorMatrix)

    Slopes = zeros(1,6); %Preloading things
    PointVsVectorMatrix = zeros(4,6);
    
    for x = 1 : 6 %Generates the slopes by taking rise over run
        Slopes(x)= VectorMatrix(x,2)/VectorMatrix(x,1);
    end
    
    for Point = 1 : 4 %Counter for the point that is compared to the line. Does each number 1:4 6 times.
        SlopeNumber = 0; %Which line is compared to
        for S = 1 : 3   %Oh man, I'm not sure
            Thingy = 1 + S; %Where am I?
            
            for x = Thingy : 4 %?? 'Hello Darkness my old friend!' ??
                SlopeNumber = SlopeNumber + 1;
                if (PointMatrix(Point,2)>(Slopes(SlopeNumber)*(PointMatrix(Point,1)-PointMatrix(S,1))+PointMatrix(S,2))) %Think of y = mx + b. Oh, you're not sure? Neither am I!
                    PointVsVectorMatrix(Point,SlopeNumber) = 1; %If the point is above the line a one is added
                end
            end
        end
    end
end






