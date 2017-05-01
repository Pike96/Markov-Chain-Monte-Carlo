%% Monte Carlo integration (a)
disp(['Monte Carlo integration:']);
clear; close all;
n = 1e3;

g =@(x)exp(sum(5.*abs(x-5)));
X = g(rand(2,n));
for iter = 1:100
    est(iter) = mean(X);
    v = 2*std(X)/sqrt(n);
end
disp(['Estimate: ',num2str(est(iter)),'	Variance: ',num2str(v)]);
disp(['Variance of estimate: ', num2str(var(est))]);

%% (b)
clear; close all;
n = 1e3;

g = @(x)cos(pi + sum(5.*x));
X = g(2.*rand(2,n)-1);
for iter = 1:100
    est(iter) = mean(X);
    v = 2*std(X)/sqrt(n);
end
disp(['Estimate: ',num2str(est(iter)),'	Variance: ',num2str(v)]);
disp(['Variance of estimate: ', num2str(var(est))]);

%% Stratified sampling (a)
disp(['Stratified sampling:']);
clear; close all;
n = 1e3;

g =@(x)exp(sum(5.*abs(x-5)));
X = g(rand(2,n));
K = 10; Nij = n/K^2; % Stratified
for iter = 1:100
    for i = 1:K
        for j = 1:K
            XS = g([i-1+rand(1,Nij);j-1+rand(1,Nij)]/K);
            XSb(i,j) = mean(XS); SS(i,j) = var(XS);
        end
    end, SST = mean(mean(SS/n));
    est(iter) = mean(mean(XSb));
    v = 2*sqrt(SST);
end
disp(['Estimate: ',num2str(est(iter)), '	Variance: ',num2str(v)]);
disp(['Variance of estimate: ', num2str(var(est))]);

%% (b)
clear; close all;
n = 1e3;


g = @(x)cos(pi + sum(5.*x));
X = g(2.*rand(2,n)-1);
K = 10; Nij = n/K^2; % Stratified
for iter = 1:100
    for i = 1:K
        for j = 1:K
            XS = g([i-1+rand(1,Nij);j-1+rand(1,Nij)]/K);
            XSb(i,j) = mean(XS); SS(i,j) = var(XS);
        end
    end, SST = mean(mean(SS/n));
end
est(iter) = mean(mean(XSb));
v = 2*sqrt(SST);
disp(['Estimate: ',num2str(est(iter)),'	Variance: ',num2str(v)]);
disp(['Variance of estimate: ', num2str(var(est))]);

%% Importance sampling (a)
disp(['Importance sampling:']);
clear; close all;
n = 1e3;

for iter = 1:100
    U = rand(2,n);
    e = exp(1); X = log(1+(e-1)*U);
    T = (e-1)^2*exp(50-6*sum(X));
    est(iter) = mean(T);
    v = 2*std(T)/sqrt(n);
end
disp(['Estimate: ',num2str(est(iter)), '	Variance: ',num2str(v)]);
disp(['Variance of estimate: ', num2str(var(est))]);

%% (b)
clear; close all;
n = 1e3;

for iter = 1:100
U = rand(2,n);
e = exp(1); X = log(1+(e-1)*U);
T = -(e-1)^2/2*(exp(i*5*sum(X)-sum(X))+exp(-i*5*sum(X)-sum(X)));
est(iter) = mean(T);
v = 2*std(T)/sqrt(n);
end

disp(['Estimate: ',num2str(est(iter)),'	Variance: ',num2str(v)]);
disp(['Variance of estimate: ', num2str(var(est))]);
