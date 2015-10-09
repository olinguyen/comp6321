clc;
clear;

x = load('./hw2x.dat');
y = load('./hw2y.dat');
x = [x ones(length(x), 1)];


Xtrain = x(1:floor(0.9 * length(x)), :);
Ytrain = y(1:floor(0.9 * length(y)));

Xtest = x(floor(0.9 * length(x))+1:end, :);
Ytest = y(floor(0.9 * length(y))+1:end);


for lambda = 0:1:100
    w = LinearRegression(Xtrain, Ytrain, lambda);
    predictedTest = Xtest*w;
    predictedTrain = Xtrain*w;
    rmseTest = rms(predictedTest - Ytest);
    rmseTrain = rms(predictedTrain - Ytrain);
    results(lambda+1, :) = [lambda rmseTrain rmseTest];
    weights(lambda+1, :) = w;
end

plot(results(:, 1), results(:, 2)); % Train error
plot(results(:, 1), results(:, 3)); % Test error
