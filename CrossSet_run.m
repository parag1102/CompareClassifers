function [Accuracy, lowerInterval, upperInterval] = CrossSet_run(Xtrain,Ytrain,k,confLevel)
    
    Xtrain = full(Xtrain);
    s = size(Xtrain,1);
    %k = 10;
    
    [crossSetLabel] = PartitionCrossSet(s,k);
    Ypredict = TrainCrossSet(Xtrain, Ytrain, crossSetLabel);
    
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
    
    %confLevel = 95;%99;
    [Accuracy, lowerInterval, upperInterval] = ConstructInterval(Ypredict,myYtest, confLevel);
end