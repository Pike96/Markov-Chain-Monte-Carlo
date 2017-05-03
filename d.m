function S = d(start,n,x,C) % Total distance from Sacramento
S = sqrt((start(1)-C(x(1),1))^2 + (start(2)-C(x(1),2))^2);
for i = 1 : n-1
    S = S + sqrt((C(x(i),1)-C(x(i+1),1))^2 + (C(x(i),2)-C(x(i+1),2))^2);
end
end