function [ cluster_idx, centroids ] = kmeans(x, k, centroids)
    [num_samples, num_feat] = size(x);
    cluster_idx = zeros(num_samples, 1);
    iterations = 100;
    epsilon = 0.01
    initial_centroids = centroids;
    dist = zeros(k, 1);
   
    for it = 1:iterations
        disp(it);
        % Assign each sample to the nearest cluster
        for i = 1:num_samples
            for j = 1:k
                dist(j) = norm(x(i, :) - centroids(j, :))^2;
            end
            [Jmin, cluster_idx(i)] = min(dist);
        end

        % Update centroids
        for i=1:k
            indices = find(cluster_idx == i);
            if isempty(indices)
               new_centroids(i, :) = initial_centroids(i, :);
            else
               new_centroids(i, :) = mean(x(indices, :));
               ssd = norm(bsxfun(@minus, new_centroids(i, :), x(indices, :)))^2;
               disp(ssd);
            end
        end
        disp(norm(new_centroids - centroids));
        if norm(new_centroids - centroids) <= epsilon
           break; 
        end
        centroids = new_centroids;
    end
end 

