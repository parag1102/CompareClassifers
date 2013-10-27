function [crossSetLabel] = PartitionCrossSet(trainSize,k)

    partitionSize = floor(trainSize/k);
    
    Mat = zeros(partitionSize,1);
    myMat = [];
    
    for ind = 1:k
        myMat = [myMat; Mat+ind];
    end
    
    if(k*partitionSize<trainSize)
        for ind2 = 1:(trainSize - (k*partitionSize))
            myMat = [myMat;ind2];
        end
    end
    
    BeforeShuffle = myMat;
    Shuffled = BeforeShuffle(randperm(size(BeforeShuffle,1)),:);
    
    crossSetLabel = Shuffled(:, 1);
    
    %count = sum(crossSetLabel(:,1)==11);
    %fprintf('%.3f\n',count);
end