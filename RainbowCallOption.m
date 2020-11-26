%Returns the price of a rainbow call on max option
function RainbowCallOption(s,K,sigma,T,N,mu,sd,d)
    W = zeros(d,N);
    ST = zeros(d,N);
    
    for i=1:d
        W(i,:) = normrnd(mu,sd,1,N);
        ST(i,:) = s*exp((-1/2*sigma^2)*T+sigma*W(i,:)*sqrt(T));
    end
    
    payoff = max(max(ST,[],1)-K,0);
    rainbowPrize = mean(payoff)
end