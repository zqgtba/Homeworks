%正态分布，均值为a,方差为b(i)
a=0;b=[1,2,3,5,10];x=-5:0.005:5;
for i=1:5
plot(x,normpdf(x,a,sqrt(b(i))));
axis([-5.1 5.1 -0.01 0.5])
grid;
hold on
end