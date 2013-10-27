function [accuracy] = getAccuracy(Ypredict, Ytest)
    
    combine = [Ytest,Ypredict];

    tp=sum( (combine(:,1)==1) & (combine(:,2)==1) );
    tn=sum( (combine(:,1)==0) & (combine(:,2)==0) );
    fp=sum( (combine(:,1)==0) & (combine(:,2)==1) );
    fn=sum( (combine(:,1)==1) & (combine(:,2)==0) );

    %precision = tp / (tp + fp);
    %recall = tp / (tp + fn);
    accuracy = (tp + tn)/(tp+fp+fn+tn);
end