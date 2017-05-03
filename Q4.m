clear;
N = 1000;
n = 47; 
C = round(20*rand(n)); 
C = C+C'; % random test network
T = 10; 
X = randperm(n); 
SX = d(n,X,C);
for k = 1 : N, Y = X;
    i = ceil(n*rand); j = ceil(n*rand);
    Y([i j]) = X([j i]); SY = d(n,X,C);
    if rand < exp((SX-SY)/T), X = Y; SX = SY; end
    T = .99*T; % disp([SX X]);
end
disp(SX);
disp(X);
