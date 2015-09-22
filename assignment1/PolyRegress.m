function [ w] = PolyRegress( x, y, d )
%POLYREGRESS 
X = ones(length(x), 1);
for n = 1:d
    X = horzcat(x.^n, X);
end
w = inv((transpose(X) * X)) * X.' * y;
