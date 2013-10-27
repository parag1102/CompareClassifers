function [accuracy1, accuracy2, p_value] = CompareClassifier(Ypredict1,Ypredict2, Ytest, crossSetLabel,isTwoTail)
    
    s = size(crossSetLabel,1);
    k = max(crossSetLabel);
    
    accuracy1 = getAccuracy(Ypredict1,Ytest);
    accuracy2 = getAccuracy(Ypredict2,Ytest);

    Y = [];
    for ind1 = 1:k
        myYtest = [];
        myYpredict1 = []; myYpredict2 = [];
        
        for ind2 = 1:s
            if(crossSetLabel(ind2,1) == ind1)
                myYtest = [myYtest;Ytest(ind2,:)];
                myYpredict1 = [myYpredict1;Ypredict1(ind2,:)];
                myYpredict2 = [myYpredict2;Ypredict2(ind2,:)];        
            end
        end
        
        error1 = 1-getAccuracy(myYpredict1, myYtest);
        error2 = 1-getAccuracy(myYpredict2, myYtest);

        Y = [Y;(error1-error2)];
    end
       
    Y_bar = sum(Y)/k;
    
    S2k = sum( (Y-Y_bar).^2 );
    S2k = S2k/(k-1);
    
    t_value = ( Y_bar*(sqrt(k)) )/sqrt(S2k);
    
    temp = 1-tcdf(t_value,k-1);
    if(temp>0.5)
        temp = 1-temp;
    end
    
    if (isTwoTail)
        p_value = 2*temp;
    else
        p_value = temp;
    end
    
    %fprintf('T-Value:%.3f\n', t_value);
end