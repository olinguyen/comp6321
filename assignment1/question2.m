u = eye(length(x));
w = WeightedLinearRegress(x, y, u);
maxIndex = max(x);
scatter(x, y);
for i = 1:0.5:5
    
    u(maxIndex, maxIndex) = i;
    w = WeightedLinearRegress(x, y, u);
    cost = CostFunction(x, y, w, 1);
end