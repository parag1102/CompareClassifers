function [Ypredict1] = TrainHeldOut1(Xtrain, Ytrain, testInstanceLabel)
    Xtrain = full(Xtrain);
    
    myXtest=[]; myYtest=[];
    myXtrain = []; myYtrain=[];
    
    for ind2 = 1:size(testInstanceLabel,1)
        if(testInstanceLabel(ind2,1) == 1)
                    myXtest = [myXtest;Xtrain(ind2,:)];
                    myYtest = [myYtest;Ytrain(ind2,:)];
                else
                    myXtrain = [myXtrain;Xtrain(ind2,:)];
                    myYtrain = [myYtrain;Ytrain(ind2,:)];
        end
    end
     
    %Ytest = myYtest;
    %save Ytest.mat Ytest;
    [Ypredict1] = nb_run(myXtrain,myYtrain,myXtest,myYtest);
end