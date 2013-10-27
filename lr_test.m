function [Pred_lr] = lr_test(model,Xtest)
    Xtest = full(Xtest);
    
    s=size(Xtest);
    %dim=s(1,2);
    totalTestDocs=s(1,1);
    Pred_lr=zeros(totalTestDocs,1);
    
    w = model;
    
    for ind = 1:totalTestDocs
        myVar = dot(Xtest(ind,:), w);
        
        if(myVar>0)
            Pred_lr(ind,1) = 1;
        else
            Pred_lr(ind,1) = 0;
        end
    end
end 