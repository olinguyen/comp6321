function [ pred ] = NaiveBayesPredict( x, u_true, std_true, u_false, std_false, prob_true, prob_false )
    [num_samples, num_features] = size(x);
   % num_features = 1;
    pred = zeros(num_samples, 1);
    
    for sample_idx = 1:num_samples
        prob_x_given_true = 1;
        prob_x_given_false = 1;
        % Calculate joint probabilities
        for i = 1:num_features
            prob_x_given_true = prob_x_given_true * GaussianProbDensity(x(sample_idx, i), u_true, std_true);
            prob_x_given_false = prob_x_given_false * GaussianProbDensity(x(sample_idx, i), u_false, std_false);
        end
        
        % Calculate class probabilities
        prob_true_given_x = (prob_x_given_true * prob_true) / ...
                (prob_x_given_true * prob_true + prob_x_given_false * prob_false);

        prob_false_given_x = (prob_x_given_false * prob_false) / ...
                        (prob_x_given_true * prob_true + prob_x_given_false * prob_false);
        
        % Make predictions
        if (prob_true_given_x > prob_false_given_x)
            pred(sample_idx) = 1;
        else
            pred(sample_idx) = 0;
        end
    end
end

