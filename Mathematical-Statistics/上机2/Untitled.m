%两个正态总体N(a1,b1),N(a2,b2)的均值检验,检验水平为p，采样数分别为n,m,H0:a2-a1=a0,重复次数为c
p=0.05;c=100;a1=1;a2=2;
%!!!控制a0的值
a0=1;
%情形1：b1,b2已知
n=80;m=100;
b1=1;b2=2;
z=ones(1,c);count=0;
for j=1:c
x=ones(1,n);y=ones(1,m);
for i=1:n
    x(i)=normrnd(a1,b1);
end
for i=1:m
     y(i)=normrnd(a2,b2);
end
z(j)=abs((mean(y)-mean(x)-a0)/sqrt(b1/n+b2/m));
if z(j)>norminv(1-p/2,0,1)
    count=count+1;
end
plot(j,z(j),'r.');
hold on
end
k=0:0.1:100;
plot(k,norminv(1-p/2,0,1),'k.');
disp('100次实验中落在拒绝域中的次数为');disp(count);
%注：拒绝域为z(j)>z(1-p/2)

