function [model] = nb_train(Xtrain,Ytrain)
    s = size(Xtrain);
    totalY=s(1,1);
    dim=s(1,2);
    countY0=sum(Ytrain==0);
    countY1=sum(Ytrain==1);
    
    Xtrain0=[];
    Xtrain1=[];
    for ind = 1:totalY
        if(Ytrain(ind, 1)==0)
            Xtrain0 = [Xtrain0 ; Xtrain(ind, :)];
        else
            Xtrain1 = [Xtrain1 ; Xtrain(ind, :)];
        end
    end
    
    tokensY0=sum(Xtrain0(:));
    tokensY1=sum(Xtrain1(:));
    Yw0=sum(Xtrain0);
    Yw1=sum(Xtrain1);
    model=[totalY,countY0,countY1,tokensY0,tokensY1,dim,Yw0,Yw1];
 
end