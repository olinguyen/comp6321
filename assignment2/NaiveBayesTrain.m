function [ u_true, std_true, u_false, std_false, prob_true, prob_false ] = NaiveBayesTrain( x, y )
    [num_samples, num_features] = size(x);
    prob_true = mean(y == 1);
    prob_false = 1 - prob_true;
    u_true = mean(x(y == 1, :));
    std_true = std(x(y == 1, :));
    u_false = mean(x(y == 0, :));
    std_false = std(x(y == 0, :));
end

