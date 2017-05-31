function[UserDialogue] = FourPointMain(PointMatrix, VectorMatrix)

    PointVsVectorMatrix = PointVsVector(PointMatrix, VectorMatrix);
    [CaseNumber, CrossedPoints] = CaseFinder(PointMatrix, VectorMatrix, PointVsVectorMatrix);
    [ShapeVectorMatrix, ShapePointMatrix] = CaseDoer(CaseNumber, PointMatrix, VectorMatrix);
    FourPointPlotter(ShapePointMatrix, PointMatrix)


end