%This function serves to give and plot all the relevant information about
%the case of 3 points (a triangle). Gives angles, sidelengths, area, and
%triangle type as well as plotting it all.


function[UserDialogue] = ThreePoint(PointMatrix, VectorMatrix)
    
    %Takes largest axial component for plotting the grid
    GridSize = max(max(abs(PointMatrix)));

    %Finds SideLength by taking the magnitude (or norm) of each vector 
    SideLength = [norm(VectorMatrix(1,:)) norm(VectorMatrix(2,:)) norm(VectorMatrix(3,:))];
  
    %Finds each angle by using the cosine law. 
    Angles = round([(acosd(((SideLength(1,1))^2 + (SideLength(1,2))^2 - (SideLength(1,3))^2)/(2*SideLength(1,1)*SideLength(1,2))));
        (acosd(((SideLength(1,1))^2 + (SideLength(1,3))^2 - (SideLength(1,2))^2)/(2*SideLength(1,1)*SideLength(1,3))));
        (acosd(((SideLength(1,2))^2 + (SideLength(1,3))^2 -(SideLength(1,1))^2)/(2*SideLength(1,2)*SideLength(1,3))))],2);
    
    PerimeterHalf = sum(SideLength)/2; %triangle area computed using Heron's formula
    Area = sqrt(PerimeterHalf*(PerimeterHalf-SideLength(1,1))*(PerimeterHalf-SideLength(1,2))*(PerimeterHalf-SideLength(1,3)));
    
    %Triangle types determined. This should be pretty straigh forward and
    %easy to read
    if any(Angles == 90)
        
        if any(Angles == 45)
            Type = 'a Right angle 45-45-90';
        elseif any(Angles == 30)
            Type = 'a Right angle 30-60-90';
        elseif any(Angles == 36.87) %is there a better solution to this check?
            Type = 'a Right angle 3-4-5';
        else
            Type = 'a Right angle';
        end
   
    elseif any(Angles > 90)
        
        if length(unique(SideLength)) == 2
            Type = 'an Obtuse Isosceles';
        else
            Type = 'an Obtuse Scalene';
        end
        
    else
        if length(unique(SideLength)) == 1
            Type = 'an Equilateral';
        elseif length(unique(SideLength)) == 2
            Type = 'an Acute Isosceles';
        else
            Type = 'an Acute Scalene';
        end
    end 
   PlotGrid(GridSize) %plots grids and each line segment.
   plot([PointMatrix(1,1) PointMatrix(2,1)],[PointMatrix(1,2) PointMatrix(2,2)],'k','LineWidth',2); hold on;
   plot([PointMatrix(1,1) PointMatrix(3,1)],[PointMatrix(1,2) PointMatrix(3,2)],'k','LineWidth',2); hold on;
   plot([PointMatrix(2,1) PointMatrix(3,1)],[PointMatrix(2,2) PointMatrix(3,2)],'k','LineWidth',2);
   
   UserDialogue = ({['You entered 3 valid points: (' num2str(PointMatrix(1,1)) ','  num2str(PointMatrix(1,2)) ') ('  num2str(PointMatrix(2,1)) ','  num2str(PointMatrix(2,2)) ') ('  num2str(PointMatrix(3,1)) ','  num2str(PointMatrix(3,2)) ')'];
       ['These 3 points form to make ' Type ' triangle with an area of ' num2str(Area) ' units squared'];
       ['Its side lengths are: ' num2str(SideLength(1,1)) ', ' num2str(SideLength(1,2)) ', and ' num2str(SideLength(1,3)) ' units long.'];
       ['Its angles are: ' num2str(Angles(1,1)) ', ' num2str(Angles(2,1)) ', and ' num2str(Angles(3,1)) ' degrees.'];});
    