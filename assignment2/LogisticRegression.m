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
function [ p ] = LogisticRegression( w, x, y )

% Append 1's to X for bias trick
x = [x ones(length(x), 1)];
p = sigmoid(x*w);

end

