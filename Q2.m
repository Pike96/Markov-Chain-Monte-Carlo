%% a
clear; close all;
% Gibbs Sampling
N = 1e5; 
X = 3*ones(1,3);
for i = 1:N
    j = ceil(3*rand);
    S = sum(X) - X(j);
    X(j) = max(15-S - log(rand)/j,0);
    H(i) = S + X(j);
end
disp(['Gibbs Sampling (a):']);
disp(['Estimate: ',num2str(mean(H)),...
    '	Variance: ',num2str(2*std(H)/sqrt(N))]);
% Simple MC
N = 1e7; X2 = -diag(1./[1:3])*log(rand(3,N));
S = sum(X2); H = S.*(S>15)/mean(S>15);
disp(['Simple MC (a):']);
disp(['Estimate: ',num2str(mean(H)),...
    '	Variance: ',num2str(2*std(H)/sqrt(N))]);

%% b
clear; close all;
% Gibbs Sampling
N = 1e5; 
X = 0.2*ones(1,3);
for i = 1:N
    j = ceil(3*rand);
    S = sum(X) - X(j);
    X(j) = max(1-S + log(rand)/j,0);
    H(i) = S + X(j);
end
disp(['Gibbs Sampling (b):']);
disp(['Estimate: ',num2str(mean(H)),...
    '	Variance: ',num2str(2*std(H)/sqrt(N))]);
% Simple MC
N = 1e7; X2 = -diag(1./[1:3])*log(rand(3,N));
S = sum(X2); H = S.*(S<1)/mean(S<1);
disp(['Simple MC (b):']);
disp(['Estimate: ',num2str(mean(H)),...
    '	Variance: ',num2str(2*std(H)/sqrt(N))]);