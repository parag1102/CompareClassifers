function [accuracy1, accuracy2, p_value] = Task_41(Xtrain,Ytrain,isTwoTail)
    k1 = 5;
    k2 = 10;
    s = size(Xtrain,1);
    
    [testInstanceLabel] = PartitionHeldOut(s, k1);
    [Ypredict1] = TrainHeldOut1(Xtrain, Ytrain, testInstanceLabel);
    [Ypredict2] = TrainHeldOut2(Xtrain, Ytrain, testInstanceLabel);

    myYtest = [];
    for ind2 = 1:size(testInstanceLabel,1)
        if(testInstanceLabel(ind2,1) == 1)
                    %myXtest = [myXtest;Xtrain(ind2,:)];
                    myYtest = [myYtest;Ytrain(ind2,:)];
                else
                    %myXtrain = [myXtrain;Xtrain(ind2,:)];
                    %myYtrain = [myYtrain;Ytrain(ind2,:)];
        end
    end
    
    s_Ytest = size(myYtest,1);
    [crossSetLabel] = PartitionCrossSet(s_Ytest,k2);
    [accuracy1, accuracy2, p_value] = CompareClassifier(Ypredict1,Ypredict2, myYtest, crossSetLabel,isTwoTail);
end