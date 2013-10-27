function Ypredict1 = TrainCrossSet1(Xtrain, Ytrain, crossSetLabel)
    Xtrain = full(Xtrain);
    
    s = size(crossSetLabel,1);
    k = max(crossSetLabel);
    
    Ypredict1 = []; %Ytest = [];
    
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
        [Predict_nb] = nb_run(myXtrain,myYtrain,myXtest,myYtest);
        Ypredict1 = [Ypredict1;Predict_nb];
    end
       
    %save Ytest.mat Ytest;
end