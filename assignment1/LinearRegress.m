function [w] = LinearRegression( x, y)
%LinearRegress % w = (X.T * X)^-1 (X.T * Y)
w = inv((transpose(x) * x)) * x.' * y;
end