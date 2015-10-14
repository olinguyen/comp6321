clear;clc;

x = load('./wpbcx.dat');
x = [x ones(length(x), 1)];
y = load('./wpbcy.dat');
[num_samples, num_features] = size(x);

% Find best learning rate
lr = [1e-9 1e-7 1e-5 1e-3 1e-1];
num_iterations = 1000;
best_lr = 10;
best_loss = +Inf;
num_folds = 10;

indices = crossvalind('Kfold', num_samples, num_folds);

for i = 1:length(lr);
    w = normrnd(0, 1, [num_features 1]) * 0.001; % generate random starting W from normal random numbers
    for fold = 1:num_folds
       test_idx = (indices == fold);
       train_idx = ~test_idx;

       Xtrain = x(train_idx, :);
       Ytrain = y(train_idx);
       Xtest = x(test_idx, :);
       Ytest = y(test_idx);
     
       w = LogisticRegressionTrain(w, Xtrain, Ytrain, lr(i), num_iterations);
       [Jtrain, ~] = LRCostFunction(w, Xtrain, Ytrain);
       [Jtest, ~] = LRCostFunction(w, Xtest, Ytest);       
       Jtrain_folds(fold, i) = Jtrain;
       Jtest_folds(fold, i) = Jtest;
    end
    [loss, loss_index] = min(mean(Jtrain_folds));
    if(loss < best_loss)
      best_loss = loss;
      best_lr = lr(i);
      best_lr_index = i;        
    end
end

% Logistic regression
w = normrnd(0, 1, [num_features 1]) * 0.001; % generate random starting W from normal random numbers
for j = 1:num_iterations
    [Jtrain, grad] = LRCostFunction(w, Xtrain, Ytrain);
    [Jtest, ~] = LRCostFunction(w, Xtest, Ytest);

    cost(j, 1) = Jtrain;
    cost(j, 2) = Jtest;
    w = w + lr(best_lr_index) * grad;
end
       
plot(1:num_iterations, cost(:, 1), 1:num_iterations, cost(:, 2));
legend('Training error', 'Testing error');
title('Training error over iterations for lr = 1e-3');
xlabel('Iterations');
ylabel('J');