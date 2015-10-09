function [ prob ] = GaussianProbDensity( x, u, stdev )
    exponent = exp(-(x - u)^2 / (2 * stdev ^ 2)); 
    prob = (1 / (stdev * sqrt(2 * pi))) * exponent;
end

