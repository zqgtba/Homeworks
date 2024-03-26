%两个正态总体N(a1,b1),N(a2,b2)的均值检验,检验水平为p，采样数分别为n,m,H0:a2-a1<=a0,重复次数为c
p=0.05;c=100;a1=1;a2=2;
%!!!控制a0的值
a0=1;
%情形4：b1,b2未知且m,n比较小
n=80;m=100;
b1=1;b2=2;
tt=ones(1,c);count=0;
for j=1:c
x=ones(1,n);y=ones(1,m);
for i=1:n
    x(i)=normrnd(a1,b1);
end
for i=1:m
     y(i)=normrnd(a2,b2);
end
tt(j)=abs((mean(y)-mean(x)-a0)/sqrt(var(x)/n+var(y)/m));
if tt(j)>tinv(1-p/2,(var(x)/n+var(y)/m)^2/(var(x)^2/(n*n*(n-1))+var(y)^2/(m*m*(m-1))))
    count=count+1;
end
plot(j,tt(j),'r.');
plot(j,tinv(1-p/2,(var(x)/n+var(y)/m)^2/(var(x)^2/(n*n*(n-1))+var(y)^2/(m*m*(m-1)))),'k.');
hold on
end
disp('100次实验中落在拒绝域中的次数为');disp(count);
%注：拒绝域为tt(j)>t(1-p/2)(r)