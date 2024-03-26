%X服从参数为a的指数分布，则其样本均值服从参数为n,na的伽马分布
a=1;n=50;
x=0:0.01:2;
plot(x,gampdf(x,n,1/(a*n)));
axis([-0.1 2.1 -0.05 3]);
grid;
hold on
%其极限分布服从参数为1/a,1/(a*a*n)的正态分布
plot(x,normpdf(x,1/a,1/(a*sqrt(n))));