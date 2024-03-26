A=ones(7,3);
t=[-1;-0.75;-0.5;0;0.25;0.5;0.75];
A(1:7,2)=t;
for i=1:7
    A(i,1)=t(i)^2;
end
y=[1;0.8125;0.75;1;1.3125;1.75;2.3125];
[p]=LS(A,y);
plot(t,y,'r.');
hold on
syms x
f=p(1)*x^2+p(2)*x+p(3);
fplot(f,[-1.25,1],'k');
error=norm(A*p-y);