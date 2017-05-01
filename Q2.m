%% a
clear; close all;
% Simple MC
n = 1e7; X2 = -diag(1./[1:3])*log(rand(3,n));
S = sum(X2); H = S.*(S>15)/mean(S>15);
disp(['Simple MC (a):']);
disp(['Estimate: ',num2str(mean(H)),...
    '	Variance: ',num2str(2*std(H)/sqrt(n))]);
% Gibbs Sampling
n = 1e5; 
X = ones(1,3)*3;
for i = 1:n
    j = ceil(3*rand);
    S = sum(X) - X(j);
    X(j) = max(15-S - log(rand)/j,0);
    H(i) = S + X(j);
end
disp(['Gibbs Sampling (a):']);
disp(['Estimate: ',num2str(mean(H)),...
    '	Variance: ',num2str(2*std(H)/sqrt(n))]);

%% b
clear; close all;
% Simple MC
n = 1e7; X2 = -diag(1./[1:3])*log(rand(3,n));
S = sum(X2); H = S.*(S<1)/mean(S<1);
disp(['Simple MC (b):']);
disp(['Estimate: ',num2str(mean(H)),...
    '	Variance: ',num2str(2*std(H)/sqrt(n))]);
% Gibbs Sampling
n = 1e5; 
X = ones(1,3)*3;
for i = 1:n
    j = ceil(3*rand);
    S = sum(X) - X(j);
    X(j) = max(1-S + log(rand)/j,0);
    H(i) = S + X(j);
end
disp(['Gibbs Sampling (b):']);
disp(['Estimate: ',num2str(mean(H)),...
    '	Variance: ',num2str(2*std(H)/sqrt(n))]);
