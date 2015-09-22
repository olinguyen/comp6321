function [degree_to_accuracies] = KFoldCV(x, y, k, d)
%KFOLDCV Performs k-fold cross-validation
    total_folds = length(x) / k;
    foldsX = reshape(x, k, total_folds);
    foldsY = reshape(y, k, total_folds);
    degree_to_accuracies = ones(d, 3);
    
    for degree = 1:d
        avgTestError = ones(k, 1);
        avgTrainingError = ones(k, 1);
        % Train on 4 folds, test on 1
        for fold = 1:k
            train_fold_idx = setxor(fold, 1:k);
            testX = reshape(foldsX(fold, :), [], 1);
            trainX = reshape(foldsX(train_fold_idx, :), [], 1);
            testY = reshape(foldsY(fold, :), [], 1);
            trainY = reshape(foldsY(train_fold_idx, :), [], 1);

            w = PolyRegress(trainX, trainY, degree);
            avgTestError(fold) = CostFunction(testX, testY, w, degree);
            avgTrainingError(fold) = CostFunction(trainX, trainY, w, degree);
        end
        meanTestError = mean(avgTestError);
        meanTrainError = mean(avgTrainingError);
        degree_to_accuracies(degree, :) = [degree meanTrainError meanTestError];
    end
end