function [Accuracy, lowerInterval, upperInterval] = ConstructInterval(Ypredict,Ytest, confLevel)
    
    s = size(Ytest,1);
    Accuracy = getAccuracy(Ypredict, Ytest);
    
    sampleError = Accuracy;
    
    temp = sqrt( (sampleError*(1-sampleError))/ s );
        
    if (confLevel == 0.95)
        zn = 1.96;
    end
    if (confLevel == 0.99)
        zn = 2.58;
    end
    
        
    lowerInterval = sampleError - (zn* temp);
    upperInterval = sampleError + (zn* temp);
       
    %fprintf('L:%.3f, U:%.3f, A:%.3f\n', lowerInterval, upperInterval, Accuracy);
end