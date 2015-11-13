function [ cluster_idx, centroids ] = kmeans(x, k, centroids)
    [num_samples, num_feat] = size(x);
    cluster_idx = zeros(num_samples, 1);
    epochs = 1;
    initial_centroids = centroids;
    dist = zeros(k, 1);
   
    for epoch = 1:epochs
        disp(epoch);
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
               centroids(i, :) = initial_centroids(i, :);
            else
               centroids(i, :) = mean(x(indices, :));
               ssd = norm(bsxfun(@minus, centroids(i, :), x(indices, :)))^2;
               disp(ssd);
            end
        end
    end
end 

