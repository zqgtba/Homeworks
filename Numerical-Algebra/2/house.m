function [v,b] = house(x)
n=length(x);
y=max(x);
x=x/y;
s=x(2:n)'*x(2:n);
v=ones(n,1);
v(2:n)=x(2:n);
if s==0
    b=0;
else
    a=sqrt(x(1)^2+s);
    if x(1)<=0
        v(1)=x(1)-a;
    else 
        v(1)=-s/(x(1)+a);
    end
    b=2*v(1)^2/(s+v(1)^2);
    v=v/v(1);
end
% H=eye(n)-b*(v*v');
end

