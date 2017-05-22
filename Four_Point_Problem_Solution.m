addpath([pwd '\Functions']) %Loads functions

%Generates the three important variables from user inputted points.
PointMatrix = GeneratePointMatrix;
VectorAmount = VectorCombos(PointMatrix);
VectorMatrix = GenerateVectorMatrix(PointMatrix, VectorAmount);

%If no valid points are entered, the user is notified.
if isempty(PointMatrix)
    msgbox('You entered zero valid points. That certainly makes things easier.')

elseif (VectorAmount) == 0
    OnePointInfo = OnePoint(PointMatrix); %See OnePoint.m tl;dr generates data for single point
    plot([0 PointMatrix(1,1)],[0 PointMatrix(1,2)]); hold on; %plots point connected to origin
    plot([-OnePointInfo(1,3)-1 OnePointInfo(1,3)+1],[0 0]); hold on; %plots x-axis
    plot([0 0], [-OnePointInfo(1,3)-1 OnePointInfo(1,3)+1]); hold on; %plots y-axis
    grid on %This one's obvious
    
    %Displays message for user.
    msgbox({['You entered a single valid point at: ' num2str(PointMatrix(1,:))]; ['If you were to connect that point to the orgin it would be: ' num2str(OnePointInfo(1,1)) ' units long.'];['The line would make an angle of: ' num2str(OnePointInfo(1,2)) ' degrees with the positive x-axis']})
    
elseif (VectorAmount) == 1
    
elseif (VectorAmount) == 3
    
elseif (VectorAmount) == 6
     
end
    
    