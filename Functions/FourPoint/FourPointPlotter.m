function[] = FourPointPlotter(ShapePointMatrix, PointMatrix)
    MaxPower = max(max(PointMatrix)); 
    
    for PlotNumber = 1 : 3
        figure
        hold on;
        PlotGrid(MaxPower)
        for PlotLine = 1 : 4
            plot([ShapePointMatrix(PlotLine,1,PlotNumber,1) ShapePointMatrix(PlotLine,1,PlotNumber,2)],[ShapePointMatrix(PlotLine,2,PlotNumber,1) ShapePointMatrix(PlotLine,2,PlotNumber,2)],'k', 'LineWidth',2)
        end    
        
        hold off;
    end