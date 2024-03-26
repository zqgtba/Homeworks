function [h,d,u,v,M,A,P] = untitled1(n,m,x,y,a,b)
%三次样条插值函数
%插值横向量x,插值纵向量y,节点个数n,边界条件m
%a,b为端点处二阶导数或一阶倒数（取决于边界条件m）

%计算分段小区间长度
for i=1:n
    h(i)=x(i+1)-x(i);
end

%计算中间参数
for i=1:n-1
    d(i)=6/(h(i)+h(i+1))*((y(i+2)-y(i+1))/h(i+1)-(y(i+1)-y(i))/h(i));
    u(i)=h(i)/(h(i)+h(i+1));
    v(i)=h(i+1)/(h(i)+h(i+1));
end

%根据m判断边界条件

%第一种边界条件，已知端点处二阶导数
if(m==1)
    d(1)=d(1)-u(1)*a;
    d(n-1)=d(n-1)-v(n-1)*b;
    d=d';
    for i=1:n-1
        A(i,i)=2;
    end
    for i=1:n-2
        A(i,i+1)=v(i);
        A(i+1,i)=u(i+1);
    end
    B=A\d;
    M(1)=a;
    M(n+1)=b;
    for i=2:n
        M(i)=B(i-1);
    end
    
%第二种边界条件，已知端点处一阶导数
elseif(m==2)
    D(1)=6/h(1)*((y(2)-y(1))/h(1)-a);
    D(n+1)=6/h(n)*(b-((y(n+1)-y(n))/h(n)));
    for i=2:n
        D(i)=d(i-1);
    end
    D=D';
    for i=1:n+1
        A(i,i)=2;
    end
    for i=2:n
        A(i,i+1)=v(i-1);
        A(i,i-1)=u(i-1);
    end
    A(1,2)=1;
    A(n+1,n)=1;
    M=A\D;
    M=M';
    
%第三种边界条件，周期型边界条件
elseif(m==3)
    d(n)=6/(h(n)+h(1))*((y(2)-y(n+1))/h(1)-(y(n+1)-y(n))/h(n));
    d=d';
    v(n)=h(1)/(h(n)+h(1));
    u(n)=1-v(n);
    for i=1:n
        A(i,i)=2;
    end
    for i=1:n-1
        A(i,i+1)=v(i);
        A(i+1,i)=u(i+1);
        A(1,n)=u(1);
        A(n,1)=v(n);
    end
    B=A\d;
    M(1)=B(n);
    for i=2:n+1
        M(i)=B(i-1);
    end
end

%代入S(x)在子区间上的表达式
for i=1:n
    %x^3的系数
    P(i,1)=(M(i+1)-M(i))/(6*h(i));
    %x^2的系数
    P(i,2)=(x(i+1)*M(i)-x(i)*M(i+1))/(2*h(i));
    %x的系数
    P(i,3)=(x(i)*x(i)*M(i+1)-x(i+1)*x(i+1)*M(i))/(2*h(i))+(y(i+1)-y(i))/h(i)-h(i)*(M(i+1)-M(i))/6;
    %常数项的系数
    P(i,4)=(x(i+1)*x(i+1)*x(i+1)*M(i)-x(i)*x(i)*x(i)*M(i+1))/(6*h(i))+(y(i)*x(i+1)-y(i+1)*x(i))/h(i)-h(i)*(M(i)*x(i+1)-M(i+1)*x(i))/6;
end

%绘制函数图像
plot(x,y,'r*')
grid;
hold on
for i=1:n
    xi=x(i):0.01:x(i+1);
    plot(xi,polyval(P(i,:),xi))
    hold on
end
end

