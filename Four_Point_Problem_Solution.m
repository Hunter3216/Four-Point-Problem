addpath([pwd '\Functions']) %Loads functions
clear

%Generates the three important variables from user inputted points.
PointMatrix = GeneratePointMatrix;
VectorAmount = VectorCombos(PointMatrix);
VectorMatrix = GenerateVectorMatrix(PointMatrix, VectorAmount);

%Case for zero points.
if isempty(PointMatrix)
    msgbox('You entered zero valid points. That certainly makes things easier.')

%Case for only a single valid point
elseif (VectorAmount) == 0
    
    OnePointData = OnePoint(PointMatrix); %See OnePoint.m tl;dr generates data from single point
    plot([-OnePointData(1,3)-1 OnePointData(1,3)+1],[0 0]); hold on; %plots x-axis
    plot([0 0], [-OnePointData(1,3)-1 OnePointData(1,3)+1]); hold on; %plots y-axis
    plot([0 PointMatrix(1,1)],[0 PointMatrix(1,2)],'k'); hold on; %plots point connected to origin
    grid on %This one's obvious
    
    %Displays message for user.
    msgbox({['You entered a single valid point at: ' num2str(PointMatrix(1,:))]; ['If you were to connect that point to the orgin it would be: ' num2str(OnePointData(1,1)) ' units long.'];['The line would make an angle of: ' num2str(OnePointData(1,2)) ' degrees with the positive x-axis']})
    
%Case for two valid points given
elseif (VectorAmount) == 1
    
    [TwoPointData, UserDialogue] = TwoPoint(PointMatrix, VectorMatrix); %See TwoPoint.m tl;dr generates data from two points
    plot([-TwoPointData(1,5)-1 TwoPointData(1,5)+1],[0 0]); hold on; %plots x-axis
    plot([0 0],[-TwoPointData(1,5)-1 TwoPointData(1,5)+1]); hold on; %plots y-axis
    plot([PointMatrix(1,1) PointMatrix(2,1)],[PointMatrix(1,2) PointMatrix(2,2)],'k'); hold on; %plots line connecting two points
    msgbox(UserDialogue)
    grid on
    
elseif (VectorAmount) == 3
    
elseif (VectorAmount) == 6
     
end
    
    