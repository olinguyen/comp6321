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
% (c)
J = CostFunction(x_biased, y, w);
disp(J);
% (d)
poly_w = PolyRegress(x, y, 2);
range = linspace(min(x),max(x));
J = CostFunction(x_biased, y, poly_w);
disp(J);
% (e)
scatter(x, y);
hold on;
plot(range, poly_w(1) * range.^2 + poly_w(2) * range + poly_w(3));
hold off;

% (f)
poly_w = PolyRegress(x, y, 3);
range = linspace(min(x),max(x));
J = CostFunction(x_biased, y, poly_w);
% (e)
scatter(x, y);
hold on;
plot(range, poly_w(1) * range.^3 + poly_w(2) * range.^2 + poly_w(3) * range + poly_w(4));
hold off;