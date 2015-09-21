function [ cost ] = CostFunction(x, y, w)
%COSTFUNCTION Computes the error cost function 
    cost = 0.5 * sum((x*w - y).^2);
end

