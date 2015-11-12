function [ cluster_idx ] = kmeans(x, k, centroids)
    [num_samples, num_feat] = size(x);
    cluster_idx = zeros(num_samples, 1);
    epochs = 50;
    
    for epoch = 1:epochs
        % Assign each sample to the nearest cluster
        for i = 1:num_samples
            minDist = Inf;
            minIdx = 1;
            for j = 1:k
                dist = sum( (x(i, :) - centroids(j, :)).^2 );

                if(dist < minDist)
                   minDist = dist;
                   minIdx = j;
                end
            end
            cluster_idx(i) = minIdx;
        end

        % Update centroids
        for i=1:k
            centroids(i, :) = mean(x(cluster_idx == j, :));
        end
    end
end

