clear;clc;

x = load('./wpbcx.dat');
x = [x ones(length(x), 1)];
y = load('./wpbcy.dat');
[num_samples, num_features] = size(x);
w = normrnd(0, 1, [num_features 1]) * 0.001; % generate random starting W from normal random numbers

% Find best learning rate
lr = [1e-9 1e-7 1e-5 1e-3 1e-1];
num_iterations = 1000;
best_lr = 10;
best_loss = +Inf;

for i = 1:length(lr);
    for j = 1:num_iterations
       [J, grad] = LRCostFunction(w, x, y);
%       disp(J);
        cost(j, i) = J;
        w = w + lr(i) * grad;
   end
   if (J < best_loss)
      best_loss = J;
      best_lr = lr(i);
      best_lr_index = i;
   end
end

plot(cost(:, best_lr_index));
title('Training error over iterations for lr = 1e-3');
xlabel('Iterations');
ylabel('J');