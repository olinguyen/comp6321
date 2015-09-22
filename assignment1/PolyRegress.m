function [ w ] = PolyRegress( x, y, d )
%POLYREGRESS 
for n = 0:d
    X = horzcat(x.^n, X);
end
w = inv((transpose(X) * X)) * X.' * y;
