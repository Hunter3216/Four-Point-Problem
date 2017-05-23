addpath([pwd '\Functions']) %Loads functions


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
    PlotGrid(OnePointData(1,3)) %See PlotGrid.m
    plot([0 PointMatrix(1,1)],[0 PointMatrix(1,2)],'k'); hold on; %plots point connected to origin

    %Displays message for user.
    msgbox({['You entered a single valid point at: ' num2str(PointMatrix(1,:))]; ['If you were to connect that point to the orgin it would be: ' num2str(OnePointData(1,1)) ' units long.'];['The line would make an angle of: ' num2str(OnePointData(1,2)) ' degrees with the positive x-axis']})
    
%Case for two valid points given
elseif (VectorAmount) == 1 
   [TwoPointData, UserDialogue] = TwoPoint(PointMatrix, VectorMatrix); %See TwoPoint.m tl;dr generates data from two points
   PlotGrid(TwoPointData(1,5)) %See PlotGrid.m tl;dr plots the grid (duh) 
   plot([PointMatrix(1,1) PointMatrix(2,1)],[PointMatrix(1,2) PointMatrix(2,2)],'k'); hold on; %plots line connecting two points
   msgbox(UserDialogue) %See TwoPointData.m for UserDialogue.
    

%Case for three valid points given creating a triangle
elseif (VectorAmount) == 3
    UserDialogue = ThreePoint(PointMatrix, VectorMatrix);
    msgbox(UserDialogue)
    
elseif (VectorAmount) == 6
    
else
     
end
    
    