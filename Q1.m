%% Monte Carlo integration (a)
disp(['Monte Carlo integration:']);
clear; close all;
n = 1e3;

ga =@(x)exp(sum(5.*abs(x-5)));
Xa = ga(rand(2,n));
mean_a = mean(Xa);
Va = 1;
est_a = 1 * mean(Xa);
var_fa = 1/(n-1)*sum((Xa - mean_a).^2);
var_a = Va^2*var_fa^2/n;
disp(['Estimate: ',num2str(est_a),'	Variance: ',num2str(var_a)]);

%% (b)
clear; close all;
n = 1e3;

gb = @(x)cos(pi + sum(5.*x));
Xb = gb(2.*rand(2,n)-1);
mean_b = mean(Xb);
Vb = 4;
est_b = 4 * mean(Xb);
var_fb = 1/(n-1)*sum((Xb - mean_b).^2);
var_b = Vb^2*var_fb^2/n;
disp(['Estimate: ',num2str(est_b),'	Variance: ',num2str(var_b)]);

%% Stratified sampling (a)
disp(['Stratified sampling:']);
clear; close all;
n = 1e4;

ga =@(x)exp(sum(5.*abs(x-5)));
Xa = ga(rand(2,n));
K = 10; Nij = n/K^2; % Stratified
for i = 1:K
    for j = 1:K
        XS = ga([i-1+rand(1,Nij);j-1+rand(1,Nij)]/K);
        XSb(i,j) = mean(XS); SS(i,j) = var(XS);
    end
end, SST = mean(mean(SS/n));
est_a = mean(mean(XSb));
var_a = 2*sqrt(SST);
disp(['Estimate: ',num2str(est_a), '	Variance: ',num2str(var_a)]);

%% (b)
clear; close all;
n = 1e3;

gb = @(x)cos(pi + sum(5.*x));
Xb = gb(2.*rand(2,n)-1);
K = 10; Nij = n/K^2; % Stratified
for i = 1:K
    for j = 1:K
        XS = gb([i-1+rand(1,Nij);j-1+rand(1,Nij)]/K);
        XSb(i,j) = mean(XS); SS(i,j) = var(XS);
    end
end, SST = mean(mean(SS/n));
est_b = mean(mean(XSb));
var_b = 2*sqrt(SST);
disp(['Estimate: ',num2str(est_b),'	Variance: ',num2str(var_b)]);

%% Importance sampling (a)
disp(['Importance sampling:']);
clear; close all;
n = 1e3;

U = rand(2,n);
e = exp(1); X = log(1+(e-1)*U);
T = (e-1)^2*exp(50-6*sum(X));
est_a = mean(T);
var_a = 2*std(T)/sqrt(n);
disp(['Estimate: ',num2str(est_a), '	Variance: ',num2str(var_a)]);

%% (B)
clear; close all;
n = 1e3;

U = rand(2,n);
e = exp(1); X = log(1+(e-1)*U);
T = -(e-1)^2/2*(exp(i*5*sum(X)-sum(X))+exp(-i*5*sum(X)-sum(X)));
est_b = mean(T);
var_b = 2*std(T)/sqrt(n);

disp(['Estimate: ',num2str(est_b),'	Variance: ',num2str(var_b)]);
