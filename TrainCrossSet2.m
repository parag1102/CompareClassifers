function Ypredict2 = TrainCrossSet2(Xtrain, Ytrain, crossSetLabel)
    Xtrain = full(Xtrain);
    
    s = size(crossSetLabel,1);
    k = max(crossSetLabel);
    
    Ypredict2 = []; %Ytest = [];
    
    for ind1 = 1:k
        myXtest = []; myYtest = [];
        myXtrain = []; myYtrain = [];
        
        for ind2 = 1:s
            if(crossSetLabel(ind2,1) == ind1)
                myXtest = [myXtest;Xtrain(ind2,:)];
                myYtest = [myYtest;Ytrain(ind2,:)];
            else
                myXtrain = [myXtrain;Xtrain(ind2,:)];
                myYtrain = [myYtrain;Ytrain(ind2,:)];
            end
        end
        
        %Ytest = [Ytest;myYtest];
        [Predict_lr] = lr_run(myXtrain,myYtrain,myXtest,myYtest);
        Ypredict2 = [Ypredict2;Predict_lr];
    end
           
    %save Ytest.mat Ytest;
end