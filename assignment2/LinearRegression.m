function [w] = LinearRegression( x, y, lambda)
%LinearRegress % w = (X.T * X)^-1 (X.T * Y)
[nx, ny] = size(x);
I = eye(ny);
w = inv(x' * x + lambda .* I) * x.' * y;
end