%Returns the price of a call option
function CallOption(sigma,T,K,s,W,N)
    ST = @(n) exp((-sigma^2*(T/2)) + (sigma*W(n)))*s;
    callPrize = sum(max(ST(1:N)-K,0)/N)
end