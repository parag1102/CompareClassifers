function [Pred_lr] = lr_run(Xtrain,Ytrain,Xtest,Ytest)
    
    [model] = lr_train(Xtrain,Ytrain);
    [Pred_lr]=lr_test(model,Xtest);

    Ytest = full(Ytest);
    combine = [Ytest,Pred_lr];
    
    tp=sum( (combine(:,1)==1) & (combine(:,2)==1) );
    tn=sum( (combine(:,1)==0) & (combine(:,2)==0) );
    fp=sum( (combine(:,1)==0) & (combine(:,2)==1) );
    fn=sum( (combine(:,1)==1) & (combine(:,2)==0) );

    precision = tp / (tp + fp);
    recall = tp / (tp + fn);
    accuracy = (tp + tn)/(tp+fp+fn+tn);
        
    %save Pred_lr.mat Pred_lr;
    %fprintf('P:%.3f, R:%.3f, A:%.3f\n', precision, recall, accuracy);
end
