clc;clear;

img = importdata('./hw4-image.txt');

displayImage(img);

k = 8;
centroids = [255 255 255; 255 0 0; 128 0 0; 0 255 0;
             0 128 0; 0 0 255; 0 0 128; 0 0 0];
         
[idx, new_centroids] = kmeans(img, k, centroids);

% Replace each pixel with the centroid to which it is closest
new_img = new_centroids(idx, :);
displayImage(new_img);

bins = histc(idx, 1:8);
disp(bins);
