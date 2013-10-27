function [model] = lr_train(Xtrain,Ytrain)
    Xtrain = full(Xtrain);
    Ytrain = full(Ytrain);
    
    myXtrain=full(Xtrain);
    myYtrain=full(Ytrain);
    
    s=size(myXtrain);
    countTrainEg = s(1,1);
    dim = s(1,2);
    
    a=0.01;l=0.5*(10^(-4));
    w=zeros(1,dim);
    maxIterations = 60;
    T = 0;
    
    LCLinit =0;
    for ind0=1:countTrainEg
        temp01 = -1*dot(Xtrain(ind0,:),w);
        p0 = (1+exp(temp01))^(-1);
        
        myVar = Ytrain(ind0,1)*log(p0) + (1-Ytrain(ind0,1))*log(1-p0);
        LCLinit = LCLinit + myVar;
    end
        
    OBJold = LCLinit - l*(norm(w)^2);
    %fprintf('First OBJ: %f\n', OBJold);
    while( true && (T<maxIterations) )
        
        BeforeShuffle = [Ytrain, Xtrain];
        Shuffled = BeforeShuffle(randperm(size(BeforeShuffle,1)),:);
        myYtrain = Shuffled(:, 1);
        myXtrain = Shuffled(:, 2:dim + 1);
       
        for ind2=1:countTrainEg
            temp1 = -1*dot(myXtrain(ind2,:),w);
            p = (1+exp(temp1))^(-1);
            temp2 = (myYtrain(ind2,1)-p)*myXtrain(ind2,:);
            w = w +(a*(temp2-2*l*w));
        end
        
        LCL =0;
        for ind3=1:countTrainEg
            temp11 = -1*dot(myXtrain(ind3,:),w);
            p1 = (1+exp(temp11))^(-1);
            myVar2 = myYtrain(ind3,1)*log(p1) + (1-myYtrain(ind3,1))*log(1-p1);
            LCL = LCL + myVar2;
        end
        
        OBJnew = LCL - l*(norm(w)^2);
        %fprintf('OBJnew: %f , Diff: %f\n', OBJnew, abs(OBJnew-OBJold));
        if( abs(OBJnew-OBJold) < (10^(-1)) )
            break;
        else
            OBJold=OBJnew;
            T=T+1;
        end
    end
    
    model = w;
end