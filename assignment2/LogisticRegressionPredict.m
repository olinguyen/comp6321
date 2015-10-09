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
function [ pred ] = LogisticRegressionPredict( w, x, y )
    p = sigmoid(x*w);
    pred = (p > 0.5);
end

