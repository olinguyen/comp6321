function [ J, grad ] = LRCostFunction( w, x, y )
 
 n = length(x);
 J = 0;
 grad = zeros(size(w));
 
 J = -sum(y .* log(sigmoid(x*w)) + (1 - y) .* log(1 - sigmoid(x*w)));
 grad = x' * sigmoid(x*w);
end

