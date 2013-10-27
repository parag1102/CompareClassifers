function [Pred_nb] = nb_run(Xtrain,Ytrain,Xtest,Ytest)
    
    [model] = nb_train(Xtrain,Ytrain);
    [Pred_nb]=nb_test(model,Xtest);

    combine = [Ytest,Pred_nb];
    
    tp=sum( (combine(:,1)==1) & (combine(:,2)==1) );
    tn=sum( (combine(:,1)==0) & (combine(:,2)==0) );
    fp=sum( (combine(:,1)==0) & (combine(:,2)==1) );
    fn=sum( (combine(:,1)==1) & (combine(:,2)==0) );

    precision = tp / (tp + fp);
    recall = tp / (tp + fn);
    accuracy = (tp + tn)/(tp+fp+fn+tn);
        
    %save Pred_nb.mat Pred_nb;
    %fprintf('P:%.3f, R:%.3f, A:%.3f\n', precision, recall, accuracy);
end
