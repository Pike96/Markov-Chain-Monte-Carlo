clear; close all;
fileID = fopen('uscap_xy.txt');
data = textscan(fileID, '%f %f');
fclose(fileID);
Axis(:,1) = data{1}; Axis(:,2) = data{2};
start = Axis(5,:); % Start from Sacramento
% Delete 2 extra and start
Axis(2,:) = []; Axis(4,:) = []; Axis(9,:) = [];
n = 47;
for k = 1:1e4
    T = 10000; C = randperm(n);
    TD(k) = d(start,n,C,Axis);
    B = 1; time(k) = 0;
    while B ~= 0, C2 = C;
        i = ceil(n*rand); j = ceil(n*rand);
        C2([i j]) = C([j i]); 
        TD2 = d(start,n,C2,Axis);
        B = exp((TD(k)-TD2)/T);
        if rand < B, C = C2; TD(k) = TD2; end
        T = .99*T; time(k) = time(k)+1;
    end
    if TD(k) < 19000, break; end;
end

figure;
scatter(start(1),start(2),'x')
xlabel('x'); ylabel('y');
hold on
scatter(Axis(:,1),Axis(:,2),'x')
plot([start(1),Axis(C(1),1)],[start(2),Axis(C(1),2)])
for i=2:length(C)
    x0=Axis(C(i-1),1); y0=Axis(C(i-1),2);
    x1=Axis(C(i),1); y1=Axis(C(i),2);
    xx=[x0,x1]; yy=[y0,y1];
    plot(xx,yy)
end

figure;
scatter(time,TD)
xlabel('Simulation time'); ylabel('Total distance');
