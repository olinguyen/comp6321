% (a)
clear;
clf;
x = load('./hw1x.dat');
y = load('./hw1y.dat');
%plot(x,y);
scatter(x, y);
% (b)
hold on;
[w, linear_x] = LinearRegress(x, y);
plot(linear_x, w(1) * linear_x + w(2));
hold off;
% (c)
J = CostFunction(x, y, w, 1);
disp(J);
% (d)
poly_w = PolyRegress(x, y, 2);
range = linspace(min(x),max(x));
J = CostFunction(x, y, poly_w, 2);
disp(J);
% (e)
scatter(x, y);
hold on;
plot(range, polyval(poly_w, range));
hold off;

% (f)
poly_w = PolyRegress(x, y, 3);
range = linspace(min(x),max(x));
J = CostFunction(x, y, poly_w, 3);
disp(J);
scatter(x, y);
hold on;
plot(range, polyval(poly_w, range));
hold off;

% (h)
k = 5;
d = 10;
degree_to_accuracies = KFoldCV(x, y, k, d);
[bestAccuracy, bestDegree] = min(degree_to_accuracies(:, 2));
poly_w = PolyRegress(x, y, bestDegree);
scatter(x, y);
hold on;
plot(range, polyval(poly_w, range));
hold off;

% (i)
normalizedX = Normalize(x);
degree_to_accuracies = KFoldCV(normalizedX, y, k, d);
[bestAccuracy, bestDegree] = min(degree_to_accuracies(:, 2));
