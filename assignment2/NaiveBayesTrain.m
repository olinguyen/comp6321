function [ u_true, std_true, u_false, std_false, prob_true, prob_false ] = NaiveBayesTrain( x, y )
    [num_samples, num_features] = size(x);
    num_features = 1;
    prob_true = mean(y == 1);
    prob_false = 1 - prob_true;
    for i = 1:length(num_features)
        u_true = mean(x(y == 1, i));
        std_true = std(x(y == 1, i));
        u_false = mean(x(y == 0, i));
        std_false = std(x(y == 0, i));
    end
end

