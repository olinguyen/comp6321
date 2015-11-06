function [ y_pred ] = knn(Xtrain, Ytrain, k, Xtest)
    [num_tests, num_features] = size(Xtest);
    [num_train, num_features] = size(Xtrain);
    
    % Compute Euclidean/L2 distance 
    dists = zeros(num_tests, num_train);
    for i = 1:num_tests
       for j = 1:num_train
          diff = Xtrain(j, :) - Xtest(i, :);
          dists(i, j) = sqrt(sum(diff.^2));
       end
    end
    
    % Find nearest neighbour
    y_pred = zeros(num_tests, 1);
    for i = 1:num_tests
        [~, sorted_dists_idx] = sort(dists(i, :));
        % Get the indices of the k nearest samples
        k_sorted_dists_idx = sorted_dists_idx(1:k);
        closest_y = Ytrain(k_sorted_dists_idx);
        
        % Find the highest label in the k nearest samples
        label_freq = histc(closest_y, 0:1);
        [~, most_common] = max(label_freq);
        y_pred(i) = most_common - 1;
    end
end