clear;
clf;
x = load('./hw1x.dat');
y = load('./hw1y.dat');
xrange = linspace(min(x),max(x));
u = eye(length(x));
w = WeightedLinearRegress(x, y, u);
[maxValue maxIndex] = max(x);
scatter(x, y);

%for i = 1:0.5:5
    i = 100;
    u(maxIndex, maxIndex) = i;
    w = WeightedLinearRegress(x, y, u);
    cost = CostFunction(x, y, w, 1);
    hold on;
    plot(xrange, polyval(w, xrange));
    hold off;
 %end