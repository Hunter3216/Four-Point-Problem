function[UserDialogue] = FourPointMain(PointMatrix, VectorMatrix)

    PointVsVectorMatrix = PointVsVector(PointMatrix, VectorMatrix);
    CaseNumber = CaseFinder(PointMatrix, VectorMatrix, PointVsVectorMatrix);




end