%两个正态总体N(a1,b1),N(a2,b2)的均值检验,检验水平为p，采样数分别为n,m,H0:a2-a1<=a0,重复次数为c
p=0.05;c=100;a1=1;a2=2;b=3;
%!!!控制a0的值
a0=1;
%情形2：b1=b2=b未知
n=80;m=100;
t=ones(1,c);count=0;
for j=1:c
x=ones(1,n);y=ones(1,m);
for i=1:n
    x(i)=normrnd(a1,b);
end
for i=1:m
     y(i)=normrnd(a2,b);
end
t(j)=abs((mean(y)-mean(x)-a0)/(sqrt(1/n+1/m)*sqrt(((n-1)*var(x)+(m-1)*var(y))/(m+n-2))));
if t(j)>tinv(1-p/2,m+n-2)
    count=count+1;
end
plot(j,t(j),'r.');
hold on
end
k=0:0.1:100;
plot(k,tinv(1-p/2,m+n-2),'k.');
disp('100次实验中落在拒绝域中的次数为');disp(count);
%注：拒绝域为t(j)>t(1-p/2)(m+n-2)
