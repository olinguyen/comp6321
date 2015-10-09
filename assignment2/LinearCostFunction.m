function [ cost ] = LinearCostFunction(x, y, w)
%COSTFUNCTION Computes the error cost function 
    alpha = 1;
    X = ones(length(x), 1);
    X = horzcat(x, X);
    cost = 0.5 * sum((X*w - y).^2) + alpha/2 * w' * w;
end

