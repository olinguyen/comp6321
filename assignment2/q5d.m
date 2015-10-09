clear;clc;

x = load('./wpbcx.dat');
x = [x ones(length(x), 1)];
y = load('./wpbcy.dat');
[num_samples, num_features] = size(x);
num_folds = 10;
lr = 1e-5;
num_iterations = 2000;


w = normrnd(0, 1, [num_features 1]) * 0.001; % generate random starting W from normal random numbers

indices = crossvalind('Kfold', num_samples, num_folds);
results = zeros(num_folds, 4);
for i = 1:num_folds
   test_idx = (indices == i);
   train_idx = ~test_idx;
   
   Xtrain = x(train_idx, :);
   Ytrain = y(train_idx);
   Xtest = x(test_idx, :);
   Ytest = y(test_idx);
   
   % Logistic regression
   w = LogisticRegressionTrain( w, Xtrain, Ytrain, lr, num_iterations);
   lr_pred_train = LogisticRegressionPredict(w, Xtrain, Ytrain);
   lr_pred_test = LogisticRegressionPredict(w, Xtest, Ytest);
   
   lr_train_acc = mean(lr_pred_train == Ytrain);   
   lr_test_acc = mean(lr_pred_test == Ytest);   

   
   % Naive bayes
   [ u_true, std_true, u_false, std_false, prob_true, prob_false ] = NaiveBayesTrain( Xtrain, Ytrain);
   nb_pred_train = NaiveBayesPredict( Xtrain, u_true, std_true, u_false, std_false, prob_true, prob_false);   
   nb_pred_test = NaiveBayesPredict( Xtest, u_true, std_true, u_false, std_false, prob_true, prob_false);
   
   nb_train_acc = mean(nb_pred_train == Ytrain);
   nb_test_acc = mean(nb_pred_test == Ytest);
   
   results(i, :) = [lr_train_acc lr_test_acc nb_train_acc nb_test_acc];
end