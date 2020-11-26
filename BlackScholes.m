%Numerical solution of the Black Scholes equation (r=0)

T = 1;
volatility = 0.2; 
K = 1.22;
alfa = 3;   %multiple for the right condition
M = 17;     %#steps in s
N = 4;      %#steps in t

s1 = 0; 
s2 = alfa*K; %s interval [s1,s2]

ds = (s2 - s1)/M;
dt = T/N;

fbv = @(s) max(K-s,0); %initial condition

sigma = @(m) (dt*volatility^2*m.^2)./2;

A = diag(1-2*sigma(1:M-1)) + diag(sigma(2:M-1),-1) + diag(sigma(1:M-2),1);

f = zeros(M-1,N+1);
f(:,N+1) = fbv((s1+ds:ds:s2-ds)');


for n=N+1:-1:2
    f(:,n-1) = A*f(:,n);
end

f = [ones(1,N+1)*K;f;zeros(1,N+1)]; % [left condition,iterative solution,right condition]

surf(0:dt:T,s1:ds:s2, f)
ylabel('s'),
xlabel('t')
