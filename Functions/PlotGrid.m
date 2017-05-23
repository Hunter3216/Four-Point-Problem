function[] = PlotGrid(GridSize)
    plot([-GridSize-1 GridSize+1],[0 0]); hold on; %plots x-axis
    plot([0 0],[-GridSize-1 GridSize+1]); hold on; %plots y-axis
    grid on; hold on;
end