function [accuracy1, accuracy2, p_value] = Task_42(Xtrain,Ytrain,isTwoTail)
    k = 10;
    s = size(Xtrain,1);
        
    [crossSetLabel] = PartitionCrossSet(s,k);
    Ypredict1 = TrainCrossSet1(Xtrain, Ytrain, crossSetLabel);
    Ypredict2 = TrainCrossSet2(Xtrain, Ytrain, crossSetLabel);

    myYtest = [];
    for ind1 = 1:k
        %myXtest = []; myYtest = [];
        %myXtrain = []; myYtrain = [];
        
        for ind2 = 1:s
            if(crossSetLabel(ind2,1) == ind1)
                %myXtest = [myXtest;Xtrain(ind2,:)];
                myYtest = [myYtest;Ytrain(ind2,:)];
            else
                %myXtrain = [myXtrain;Xtrain(ind2,:)];
                %myYtrain = [myYtrain;Ytrain(ind2,:)];
            end
        end
    end
    
    [accuracy1, accuracy2, p_value] = CompareClassifier(Ypredict1,Ypredict2, myYtest, crossSetLabel,isTwoTail);
end