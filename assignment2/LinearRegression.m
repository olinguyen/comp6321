function [w] = LinearRegression( x, y, lambda, reg)
%LinearRegress % w = (X.T * X)^-1 (X.T * Y)
[nx, ny] = size(x);
if reg == 'l1'
    A = [1, 1, 1, 1;
         1, 1, 1, -1;
         1, 1, -1, 1;
         1, 1, -1, -1;

         1, -1, 1, 1;
         1, -1, 1, -1;
         1, -1, -1, 1;
         1, -1, -1, -1;

         -1, 1, 1, 1;
         -1, 1, 1, -1;
         -1, 1, -1, 1;
         -1, 1, -1, -1;

         -1, -1, 1, 1;
         -1, -1, 1, -1;
         -1, -1, -1, 1;
         -1, -1, -1, -1];

    H = 2 * x' * x;
    f = 2 * x' * y;
    b = ones(length(A), 1);
    w = quadprog(H,f,A,b);
elseif reg == 'l2'
    I = eye(ny);
    w = inv(x' * x + lambda .* I) * x.' * y;
else
    disp('Could not recognize regularization type');
end



end