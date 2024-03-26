h=1/40;tau=1/3200;r=tau/h^2;
J=1/h;N=1/tau;
t=zeros(N,1);
for n=1:N
    t(n)=n*tau;
end
x=zeros(J+1,1);
for j=0:J
    x(j+1)=j*h;
end
u0=zeros(J+1,1);
for j=0:J
    u0(j+1)=cos(pi*x(j+1));
end

%向前格式
F1=zeros(J+1,1);
B1=(1-2*r)*eye(J+1);
B1(1,2)=2*r;B1(J+1,J)=2*r;
for i=2:J
    B1(i,i-1)=r;
    B1(i,i+1)=r;
end
u1=zeros(J+1,N);
n=1;
for j=1:J+1
    F1(j)=sin(0);
end
u1(1:(J+1),1)=B1*u0+tau*F1;
for n=2:N
    for j=1:J+1
        F1(j)=sin(t(n-1));
    end
    u1(1:(J+1),n)=B1*u1(1:(J+1),(n-1))+tau*F1;
end
result1=zeros(1,5);
for i=0:4
    result1(i+1)=u1((1+i*J/4),N);
end

%向后格式
F2=zeros(J+1,1);
A2=(1+2*r)*eye(J+1);
A2(1,2)=-2*r;A2(J+1,J)=-2*r;
for i=2:J
    A2(i,i-1)=-r;
    A2(i,i+1)=-r;
end
u2=zeros(J+1,N);
n=1;
for j=1:J+1
    F2(j)=sin(t(1));
end
u2(1:(J+1),1)=A2\u0+tau*(A2\F2);
for n=2:N
    for j=1:J+1
        F2(j)=sin(t(n));
    end
    u2(1:(J+1),n)=A2\u2(1:(J+1),(n-1))+tau*(A2\F2);
end
result2=zeros(1,5);
for i=0:4
    result2(i+1)=u2((1+i*J/4),N);
end

%Crank-Nicolson格式
F3=zeros(J+1,1);
A3=(1+r)*eye(J+1);
A3(1,2)=-r;A3(J+1,J)=-r;
B3=(1-r)*eye(J+1);
B3(1,2)=r;B3(J+1,J)=r;
for i=2:J
    A3(i,i-1)=-r/2;
    A3(i,i+1)=-r/2;
    B3(i,i-1)=r/2;
    B3(i,i+1)=r/2;
end
u3=zeros(J+1,N);
n=1;
for j=1:J+1
    F3(j)=(sin(0)+sin(t(1)))/2;
end
u3(1:(J+1),1)=A3\B3*u0+tau*(A3\F3);
for n=2:N
    for j=1:J+1
        F3(j)=(sin(t(n-1))+sin(t(n)))/2;
    end
    u3(1:(J+1),n)=A3\B3*u3(1:(J+1),(n-1))+tau*(A3\F3);
end
result3=zeros(1,5);
for i=0:4
    result3(i+1)=u3((1+i*J/4),N);
end