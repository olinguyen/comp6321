% A)
mu = [5 20];
sigma = [10 2; 2 5];
data = mvnrnd(mu, sigma, 200);

plot(data(:, 1), data(:, 2));

% B) 
sub = bsxfun(@minus, data, mu); % Subtract the mean from all data points
[coeff,score,latent,tsquare] = princomp(sub); % Compute PCA

clf();
hold on;
plot(coeff);
scatter(sub(:, 1), sub(:, 2));
hold off;

% C)

data_c = sub ./ std(data);
[coeff,score,latent,tsquare] = princomp(sub); % Compute PCA
clf();
hold on;
plot(coeff);
scatter(data_c(:, 1), data_c(:, 2));
hold off;

% D)

data_d = data(:, 2) * 1000;
[coeff,score,latent,tsquare] = princomp(sub); % Compute PCA
clf();
hold on;
plot(coeff);
scatter(data_d(:, 1), data_d(:, 2));
hold off;