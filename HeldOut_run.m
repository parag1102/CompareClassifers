function [Accuracy, lowerInterval, upperInterval] = HeldOut_run(Xtrain,Ytrain,k,confLevel)
    
    Xtrain = full(Xtrain);
    s = size(Xtrain,1);
    %k = 2;
    
    [testInstanceLabel] = PartitionHeldOut(s, k);
    [Ypredict] = TrainHeldOut(Xtrain, Ytrain, testInstanceLabel); 
    
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
    
    %confLevel = 95;%99;
    [Accuracy, lowerInterval, upperInterval] = ConstructInterval(Ypredict,myYtest, confLevel);
end