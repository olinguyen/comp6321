function [ cost ] = CostFunction(x, y, w, d)
%COSTFUNCTION Computes the error cost function 
    X = ones(length(x), 1);
    for n = 1:d
        X = horzcat(x.^n, X);
    end
    cost = 0.5 * sum((X*w - y).^2);
end

