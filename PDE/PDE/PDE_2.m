N=32;h1=pi/N;h2=1/N;
x=zeros(N+1,1);y=zeros(N+1,1);
for i=0:N
    x(i+1)=i*h1;
end
for j=0:N
    y(j+1)=j*h2;
end
u=zeros(N+1,N+1);uu=zeros((N+1)^2,1);
b=zeros((N+1)^2,1);A=zeros((N+1)^2,(N+1)^2);
for i=1:(N-1)
    for j=1:(N-1)
        b((i-1)*(N-1)+j)=cos(3*x(i+1))*sin(pi*y(j+1));
        A(((i-1)*(N-1)+j),((i-1)*(N-1)+j))=2/(h1^2)+2/(h2^2);
        if i==1
            A(((i-1)*(N-1)+j),((N-1)^2+(2*N+2)+j))=-1/(h1^2);
        else 
            A(((i-1)*(N-1)+j),((i-2)*(N-1)+j))=-1/(h1^2);
        end
        if i==N-1
            A(((i-1)*(N-1)+j),((N-1)^2+(3*N+1)+j))=-1/(h1^2);
        else
            A(((i-1)*(N-1)+j),(i*(N-1)+j))=-1/(h1^2);
        end
        if j==1
            A(((i-1)*(N-1)+j),((N-1)^2+i+1))=-1/(h2^2);
        else
            A(((i-1)*(N-1)+j),((i-1)*(N-1)+j-1))=-1/(h2^2);
        end
        if j==N-1
            A(((i-1)*(N-1)+j),((N-1)^2+N+1+i+1))=-1/(h2^2);
        else
            A(((i-1)*(N-1)+j),((i-1)*(N-1)+j+1))=-1/(h2^2);
        end            
    end
end
for k=1:(2*N+2)
    A((N-1)^2+k,(N-1)^2+k)=1;
end
for k=1:(N-1)
    A((N-1)^2+2*N+2+k,(N-1)^2+2*N+2+k)=1;
    A((N-1)^2+2*N+2+k,k)=-1;
end
for k=1:(N-1)
    A((N-1)^2+3*N+1+k,(N-1)^2+3*N+1+k)=1;
    A((N-1)^2+3*N+1+k,(N-1)*(N-2)+k)=-1;
end
uu=A\b;
for i=1:(N-1)
    for j=1:(N-1)
        u(i+1,j+1)=uu((i-1)*(N-1)+j);
    end
end
for k=0:N
    u(k+1,1)=uu((N-1)^2+k+1);
end
for k=0:N
    u(k+1,N+1)=uu((N-1)^2+N+1+k+1);
end
for k=0:(N-2)
    u(1,k+2)=uu((N-1)^2+2*N+2+k+1);
end
for k=0:(N-2)
    u(N+1,k+2)=uu((N-1)^2+3*N+1+k+1);
end
uuu=zeros(3,3);
for i=1:3
    for j=1:3
        uuu(i,j)=u(j*N/4+1,i*N/4+1);
    end
end
u_real=zeros(3,3);
for i=1:3
    for j=1:3
        u_real(j,i)=(9+pi^2)^(-1)*cos(3*i*pi/4)*sin(j*pi/4);
    end
end
