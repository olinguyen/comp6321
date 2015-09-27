% (a)
clear;
clf;
x = load('./hw1x.dat');
y = load('./hw1y.dat');
xrange = linspace(min(x),max(x));

%plot(x,y);
scatter(x, y);
% (b)
hold on;
w = LinearRegress(x, y);
plot(xrange, polyval(w, xrange));
hold off;
% (c)
J = CostFunction(x, y, w, 1);
disp(J);
% (d)
w = PolyRegress(x, y, 2);
J = CostFunction(x, y, w, 2);
disp(J);
% (e)
scatter(x, y);
hold on;
plot(xrange, polyval(w, xrange));
hold off;

% (f)
w = PolyRegress(x, y, 3);
J = CostFunction(x, y, w, 3);
disp(J);
scatter(x, y);
hold on;
plot(xrange, polyval(w, xrange));
hold off;

% (h)
k = 5;
d = 10;
degree_to_accuracies = KFoldCV(x, y, k, d);
[bestAccuracy, bestDegree] = min(degree_to_accuracies(:, 2));
w = PolyRegress(x, y, bestDegree);
scatter(x, y);
hold on;
plot(xrange, polyval(w, xrange));
hold off;

% (i)
normalizedX = Normalize(x);
degree_to_accuracies = KFoldCV(normalizedX, y, k, d);
[bestAccuracy, bestDegree] = min(degree_to_accuracies(:, 2));
