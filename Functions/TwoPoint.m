%This function serves to generate information in the case of Two valid
%points being given. It will generate, in order, these following data:
%Length of line
%Slope of line
%x-axis
%y-axis
%Largest axial component for plotting axes
%string for x-axis
%string for y-axis

function[TwoPointData, UserDialogue] = TwoPoint(PointMatrix, VectorMatrix)
    TwoPointData = zeros(1,5);
    
    TwoPointData(1,1) = norm(VectorMatrix); %magnitude of line
    TwoPointData(1,2) = (VectorMatrix(1,2)/VectorMatrix(1,1)); %slope of line
    
    try %try because if the slope is 0 it would crash
        TwoPointData(1,3) = interp1([PointMatrix(1,2) PointMatrix(2,2)],[PointMatrix(1,1) PointMatrix(2,1)],0); %x-intercept
        if isnan(TwoPointData(1,3)) %if it's NaN the x-int is extrapolated
        
            TwoPointData(1,3) = interp1([PointMatrix(1,2) PointMatrix(2,2)],[PointMatrix(1,1) PointMatrix(2,1)],0,'linear','extrap');
            XInt = (['By extrapolation, the x intercept is: (' num2str(TwoPointData(1,3)) ',0)']);
        
        else
            XInt = (['The x intercept is: (' num2str(TwoPointData(1,3)) ',0)']);
        end
    catch
        XInt = ('There is no x intercept');
        TwoPointData(1,3) = NaN;
    end
    
    try %try because if the slope is inf it would crash
        TwoPointData(1,4) = interp1([PointMatrix(1,1) PointMatrix(2,1)],[PointMatrix(1,2) PointMatrix(2,2)],0); %y-intercept
        if isnan(TwoPointData(1,4)) %if it's NaN y-int is extrapolated
            TwoPointData(1,4) = interp1([PointMatrix(1,1) PointMatrix(2,1)],[PointMatrix(1,2) PointMatrix(2,2)],0,'linear','extrap');
            YInt = (['By extrapolation, the y intercept is: (0,' num2str(TwoPointData(1,4)) ')']);
        else
            YInt = (['The y intercept is: (0,' num2str(TwoPointData(1,4)) ')']);
        end
    catch
        YInt = ('There is no y intercept');
        TwoPointData(1,4) = NaN;
    end
    
    TwoPointData(1,5) = max(max(abs(PointMatrix))); %largest axis component for plotting axes
    
    if TwoPointData(1,2) == 0 %if the slope is 0 then the corresponding equation is made 
        UserDialogue = ({['You entered two valid points: (' num2str(PointMatrix(1,1)) ',' num2str(PointMatrix(1,2)) ') (' num2str(PointMatrix(2,1)) ',' num2str(PointMatrix(2,2)) ')'];
            ['They create a line of: y=' num2str(PointMatrix(1,2)) ' from x= ' num2str(PointMatrix(1,1)) ' to ' num2str(PointMatrix(2,1))];
            ['The line is: ' num2str(TwoPointData(1,1)) ' units long.'];
            ['The slope is: ' num2str(TwoPointData(1,2))];
            XInt;
            YInt});
    
    elseif TwoPointData(1,2) == inf %if the slope is inf then a parametrized equation is given
        UserDialogue = ({['You entered two valid points: (' num2str(PointMatrix(1,1)) ',' num2str(PointMatrix(1,2)) ') (' num2str(PointMatrix(2,1)) ',' num2str(PointMatrix(2,2)) ')'];
            'Since the slope is undefined the function must be written as a parametrization.';
            ['The line can be expressed by: (' num2str(PointMatrix(1,1)) ',t) t = ' num2str(PointMatrix(1,2)) ' to ' num2str(PointMatrix(2,2))];
            ['The line is: ' num2str(TwoPointData(1,1)) ' units long'];
            ['The slope is: ' num2str(TwoPointData(1,2))];
            XInt;
            YInt});
    else %There is a much better way to optimize this but it's Sunday at 2am and I'm out of fucks to give.
        UserDialogue = ({['You entered two valid points: (' num2str(PointMatrix(1,1)) ',' num2str(PointMatrix(1,2)) ') (' num2str(PointMatrix(2,1)) ',' num2str(PointMatrix(2,2)) ')'];
            ['They create a line of: y= ' num2str(TwoPointData(1,2)) 'x  + ' num2str(TwoPointData(1,4)) ' from x = ' num2str(PointMatrix(1,1)) ' to ' num2str(PointMatrix(2,1))];
            ['The line is: ' num2str(TwoPointData(1,1)) ' units long.'];
            ['The slope is: ' num2str(TwoPointData(1,2))];
            XInt;
            YInt});
    
    end   
        
end

%There UserDialogue is kinda clunky but again, it's 2am. I may revisit for
%a more elegant thing
