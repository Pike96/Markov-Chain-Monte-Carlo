clear; close all;
fileID = fopen('uscap_xy.txt');
data = textscan(fileID, '%f %f');
fclose(fileID);
C(:,1) = data{1};
C(:,2) = data{2};
start = C(5,:); % Start from Sacramento
% Delete 2 extra and start
C(2,:) = [];
C(4,:) = [];
C(9,:) = [];
n = 47;
E = 1000;
for k = 1:E
    T = 10000;
    X = randperm(n);
    SX(k) = d(start,n,X,C);
    B = 1; t(k) = 0;
    while B ~= 0, Y = X;
        i = ceil(n*rand); j = ceil(n*rand);
        Y([i j]) = X([j i]); 
        SY = d(start,n,Y,C);
        B = exp((SX(k)-SY)/T);
        if rand < B, X = Y; SX(k) = SY; end
        T = .99*T;
        t(k) = t(k)+1;
    end
end

figure;
scatter(start(1),start(2),'x')
xlabel('x'); ylabel('y');
hold on
scatter(C(:,1),C(:,2),'x')
hold on
plot([start(1),C(X(1),1)],[start(2),C(X(1),2)])
hold on
for i=2:length(X)
    x0=C(X(i-1),1);
    y0=C(X(i-1),2);
    x1=C(X(i),1);
    y1=C(X(i),2);
    xx=[x0,x1];
    yy=[y0,y1];
    plot(xx,yy)
    hold on
end

figure;
scatter(t,SX)
xlabel('Simulation time'); ylabel('Total distance');
