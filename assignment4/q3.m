clc;clear;

img = importdata('./hw4-image.txt');
img = uint8(img);

k = 8;
centroids = [255 255 255; 255 0 0; 128 0 0; 0 255 0;
             0 128 0; 0 0 255; 0 0 128; 0 0 0];
         
idx = kmeans(img, k, centroids);
             