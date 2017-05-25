Vector = [3 0; -1 5];


    TempAngle = [0 0];
    TempAngle(1) = atan2d(Vector(1,2),Vector(1,1));

    if TempAngle(1) < 0
        TempAngle(1) = TempAngle(1) + 360;
    end

    TempAngle(2) = atan2d(Vector(2,2),Vector(2,1));
    if TempAngle(2) < 0
        TempAngle(2) = TempAngle(2) + 360;
    end
    Angle = abs(TempAngle(1) - TempAngle(2))