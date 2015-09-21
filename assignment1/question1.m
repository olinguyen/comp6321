% (a)
clear;
clf;
x = load('./hw1x.dat');
y = load('./hw1y.dat');
%plot(x,y);
scatter(x, y);
% (b)
hold on;
x_biased = [x ones(length(x), 1)];
% w = (X.T * X)^-1 (X.T * Y)
w = inv((transpose(x_biased) * x_biased)) * x_biased.' * y;
plot(x, w(1) * x + w(2));
hold off;

J = CostFunction(x_biased, y, w);

poly_w = PolyRegress(x, y, 2);
