clear; close all;
x = linspace(-500,500);
y = linspace(-500,500);
[X,Y] = meshgrid(x,y);
Z = 418.9829*2 - X.*sin(sqrt(abs(X))) - Y.*sin(sqrt(abs(Y)));

n = 200^2;
theo_min = min(min(Z));
[tx,ty]=find(Z==min(min(Z)));
disp(['Theoretical min: ',num2str(theo_min),...
    ', x=',num2str(X(1,tx)),' y=',num2str(Y(ty,1))]);

for i = 1:50
    [xt,yt] = SA(Z,50);  H(1,i) = Z(xt(end),yt(end));
    [xt,yt] = SA(Z,200); H(2,i) = Z(xt(end),yt(end));
    [xt,yt] = SA(Z,1e3); H(3,i) = Z(xt(end),yt(end));
    [xt,yt] = SA(Z,1e4); H(4,i) = Z(xt(end),yt(end));
end
figure(1)
contour(X,Y,Z); % Plot a contour plot
xlabel('x'); ylabel('y');
colorbar; hold on;
scatter(X(1,xt),Y(yt,1),'xr');
for i=2:length(xt)
    x0=X(1,xt(i-1)); y0=Y(yt(i-1),1);
    x1=X(1,xt(i)); y1=Y(yt(i),1);
    xx=[x0,x1]; yy=[y0,y1];
    plot(xx,yy)
end
figure(2)
subplot(2,2,1); hist(H(1,:)); title('N = 50');
xlabel('Value'); ylabel('Times');
subplot(2,2,2); hist(H(2,:)); title('N = 100');
xlabel('Value'); ylabel('Times');
subplot(2,2,3); hist(H(3,:)); title('N = 1000');
xlabel('Value'); ylabel('Times');
subplot(2,2,4); hist(H(4,:)); title('N = 10000');
xlabel('Value'); ylabel('Times');
