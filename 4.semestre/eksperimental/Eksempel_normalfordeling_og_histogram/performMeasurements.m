function output = performMeasurements(N)
    X = 10;
    sigma = 1;
    output = normrnd(X, sigma, N, 1);
end