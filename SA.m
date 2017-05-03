function [xt,yt] = SA(Z,E)
T = 100;
t = 0;
xt = 50; yt = 50; % (xt,yt)=(0,0)
for i = 1:E
    xtp = round(xt(end) + normrnd(0,30)); ytp = round(yt(end) + normrnd(0,30));
    % Bound conditions
    if xtp > 100, xtp = 100; end
    if xtp < 1, xtp = 1; end
    if ytp > 100, ytp = 100; end
    if ytp < 1, ytp = 1; end
    
    alpha = exp((Z(xtp,ytp)-Z(xt(end),yt(end)))/T);
    if rand > alpha || Z(xtp,ytp)<=Z(xt(end),yt(end))
        xt = [xt xtp]; yt = [yt ytp]; end
    %T = exp(-alpha*sqrt(T)); T = alpha^T;
    T = T*log(t+1); t = t+1;
end