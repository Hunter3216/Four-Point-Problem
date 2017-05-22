%This Functions serves to generate all the info required for the case of
%only 1 point be given. It connects the point to the origin and finds its
%magnitude, its angle to the positive x-axis and the max magnitude of the
%point's components for plotting the axes.

function[OnePointData] = OnePoint(PointMatrix)
    
    OnePointData = zeros(1,3);
    OnePointData(1,1) = norm(PointMatrix(1,:)); %Magnitude
    OnePointData(1,2) = atan2d(1*PointMatrix(1,2)-0*PointMatrix(1,1),1*PointMatrix(1,1)+0*PointMatrix(1,2)); %Angle. Thanks to Roger Stafford on mathworks.com
    OnePointData(1,3) = max(abs(PointMatrix(1,1)),abs(PointMatrix(1,2))); %Biggest axis
    
    if OnePointData(1,2) < 0 %adds 360 the case of being below the x-axis; otherwise it would be negative and I'd like to be consistent
        OnePointData(1,2) = OnePointData(1,2) + 360;
    end

end


