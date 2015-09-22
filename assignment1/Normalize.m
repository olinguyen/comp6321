function [ normalized ] = Normalize( X )
%NORMALIZE Summary of this function goes here
    maxValue = max(X);
    minValue = min(X);
    
    %normalized = (X - minValue) ./ (maxValue - minValue);
    normalized = X ./ maxValue;
end

