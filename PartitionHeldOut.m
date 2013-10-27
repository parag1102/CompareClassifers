function [testInstanceLabel] = PartitionHeldOut(trainSize, k)
    
    numTestInstances = floor(trainSize/k);
    numTrainInstances = trainSize - numTestInstances;
    
    myMat = [ones(numTestInstances,1);zeros(numTrainInstances,1)];
    
    BeforeShuffle = myMat;
    Shuffled = BeforeShuffle(randperm(size(BeforeShuffle,1)),:);
    
    testInstanceLabel = Shuffled(:, 1);
end
    
    
        