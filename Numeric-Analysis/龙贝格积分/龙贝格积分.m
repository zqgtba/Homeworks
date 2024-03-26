function [T,S,C,R] = untitled2(a,b,f,r)
%龙贝格积分
%输入：积分区间[a，b],被积函数f,要求精度r
%调试时别忘了 format long!

%初步计算
T(1)=(b-a)*(f(a)+f(b))/2;
for i=2:5    
    T(i)=0.5*T(i-1)+(b-a)/(2^(i-1))*sum(arrayfun(@(x)f(a+((2*x)-1)*(b-a)/(2^(i-1))),1:2^(i-2)));
end
for i=1:4
    S(i)=T(i+1)+(T(i+1)-T(i))/3;
end
for i=1:3
    C(i)=S(i+1)+(S(i+1)-S(i))/15;
end
for i=1:2
    R(i)=C(i+1)+(C(i+1)-C(i))/63;
end
d=R(2)-R(1);
k=3;

%循环计算,直到满足精度
while(abs(d)>r)
    T(k+3)=0.5*T(k+2)+(b-a)/(2^(k+2))*sum(arrayfun(@(x)f(a+((2*x)-1)*(b-a)/(2^(k+2))),1:2^(k+1)));
    S(k+2)=T(k+3)+(T(k+3)-T(k+2))/3;
    C(k+1)=S(k+2)+(S(k+2)-S(k+1))/15;
    R(k)=C(k+1)+(C(k+1)-C(k))/63;
    d=R(k)-R(k-1);
    k=k+1;
end
end

