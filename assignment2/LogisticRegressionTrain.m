%%%
%  w (weights)    : D x K
%  x (input data) : N x D
%  y (label)      : K x 1
%  
% Output
%
% p = probability of our classification : N x K
%
%%%
function [w] = LogisticRegressionTrain( w, x, y, lr, num_iterations )
    for j = 1:num_iterations
       [J, grad] = LRCostFunction(w, x, y);
       w = w - lr * grad;
    end
end

