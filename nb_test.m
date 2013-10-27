function [Pred_nb] = nb_test(model,Xtest)
    s=size(Xtest);
    dim=s(1,2);
    totalTestDocs=s(1,1);
    Pred_nb=[];
    
    totalY = model(1,1);
    countY0 = model(1,2);
    countY1 = model(1,3);
    tokensY0 = model(1,4);
    tokensY1 = model(1,5);
    
    count = model(1,6);
    Yw0 = model(:,7:(6+count));
    Yw1 = model(:,(7+count:end));
    
    prior0=countY0/totalY;
    prior1=countY1/totalY;
    smoothProbYw0 = (Yw0+1)/(tokensY0+dim);
    smoothProbYw1 = (Yw1+1)/(tokensY1+dim);
    
    lnsmoothProbYw0=log(smoothProbYw0);
    lnsmoothProbYw1=log(smoothProbYw1);
    
    for ind = 1:totalTestDocs
        lntemp0 = sum(Xtest(ind,:).*lnsmoothProbYw0);
        lntemp1 = sum(Xtest(ind,:).*lnsmoothProbYw1);
        
        logLikely0 = lntemp0 + log(prior0);
        logLikely1 = lntemp1 + log(prior1);
        
        if(logLikely0>logLikely1)
            Pred_nb = [Pred_nb; 0];
        else
            Pred_nb = [Pred_nb; 1];
        end
    end
end 