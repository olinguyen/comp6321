clc;clear;
x = load('./wpbcx.dat');
y = load('./wpbcy.dat');

[num_samples, num_features] = size(x);
num_folds = 10;
k_nearest = 100;

indices = crossvalind('Kfold', num_samples, num_folds);
k_accs = zeros(k_nearest, 2);
for k = 1:k_nearest
    train_accs = zeros(num_folds, 1);
    test_accs = zeros(num_folds, 1);
    for i = 1:num_folds
       test_idx = (indices == i);
       train_idx = ~test_idx;

       Xtrain = x(train_idx, :);
       Ytrain = y(train_idx);
       Xtest = x(test_idx, :);
       Ytest = y(test_idx);

       pred_train = knn(Xtrain, Ytrain, k, Xtrain);
       pred_test = knn(Xtrain, Ytrain, k, Xtest);
       
       train_accs(i) = mean(pred_train == Ytrain);
       test_accs(i) = mean(pred_test == Ytest);
    end
    k_accs(k, 1) = mean(train_accs);
    k_accs(k, 2) = mean(test_accs);
end

plot(1:100, k_accs(:, 1), 1:100, k_accs(:, 2));
title('10-fold cross-validation on k');
xlabel('k');
ylabel('Cross-validation accuracy');
legend('Training accuracy', 'Testing accuracy');