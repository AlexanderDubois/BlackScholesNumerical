function MonteCarlo
    N = 1000;       %#steps
    T = 1;          %final time
    sigma = 0.2;    %volatility        
    K = 1.22;       %fixed price
    s = K;          %stock price
    mu = 0;         %mean         
    sd = sqrt(T);   %standard deviation
    d = 2;          %dimension
    
    W = normrnd(mu,sd,1,N); %normal distribution

    CallOption(sigma,T,K,s,W,N);
    RainbowCallOption(s,K,sigma,T,N,mu,sd,d);
end

