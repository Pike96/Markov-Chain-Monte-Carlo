%% Monte Carlo integration (a)
disp(['Monte Carlo integration:']);
clear; close all;
n = 1e6;

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
n = 1e6;

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
n = 1e6;

ga =@(x)exp(sum(5.*abs(x-5)));
Xa = ga(rand(2,n));
K = 20; Nij = n/K^2; % Stratified
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
n = 1e6;

gb = @(x)cos(pi + sum(5.*x));
Xb = gb(2.*rand(2,n)-1);
K = 20; Nij = n/K^2; % Stratified
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
n = 1e6;

%w = @(x)1./mvnpdf(x',[5 5])';
%w = @(x)1./(1/sqrt(2*pi).*exp(-(x(1,:)-5).^2/2-(x(2,:)-5).^2/2));
w = @(x)1./(1/sqrt(2*pi).*exp(-(x-5).^2/2));
f = @(x)exp(5.*abs(x-5));
%f = @(x)exp(sum(5.*abs(x-5)));
X = normrnd(5,1,2,n);
T = w(X(1,:)).*f(X(1,:)).*w(X(2,:)).*f(X(2,:));
%T = (e-1)^2*exp(sum(5.*abs(X-5)).^2-sum(X));
est_a = mean(T);
var_a = 2*std(T)/sqrt(n);
