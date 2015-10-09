function w = WeightedLinearRegress( x, Y, U)
%LinearRegress % w = (X.T * X)^-1 (X.T * Y)
X = ones(length(x), 1);
X = horzcat(x, X);
w = inv((transpose(X) * U * X)) * X' * U * Y;
