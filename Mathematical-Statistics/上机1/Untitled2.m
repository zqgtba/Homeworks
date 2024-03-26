%注意：每次只取三种分布之一运行!
%卡方分布，参数为k(i)
x=0:0.005:14;
for i=1:5
plot(x,chi2pdf(x,k(i)));%或plot(x,gampdf(x,k(1)/2,2));
axis([-0.4 14.4 -0.02 0.62])
grid;
hold on
end
%F分布，参数为m(i),n(i)
x=0:0.005:4;
m=[1,1,1,5,10];n=[100,1,10,10,10];
for i=1:5
plot(x,fpdf(x,m(i),n(i)));
axis([-0.2 4.2 -0.05 1.05])
grid;
hold on
end
%t分布，参数为k(i)
x=-5:0.005:5;
k=[1,2,3,10,100];
for i=1:5
plot(x,tpdf(x,k(i)));
axis([-5.2 5.2 -0.01 0.51])
grid;
hold on
end