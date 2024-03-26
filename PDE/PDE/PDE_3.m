N=32;h1=pi/N;h2=1/N;
x=zeros(N+1,1);y=zeros(N+1,1);
for i=0:N
    x(i+1)=i*h1;
end
for j=0:N
    y(j+1)=j*h2;
end
b=zeros((N-1)^2,1);A=zeros((N-1)^2,(N-1)^2);
for i=1:(N-1)
    for j=1:(N-1)
        b((i-1)*(N-1)+j)=cos(3*x(i+1))*sin(pi*y(j+1));
        A(((i-1)*(N-1)+j),((i-1)*(N-1)+j))=2/(h1^2)+2/(h2^2);
        if i==1
            A(((i-1)*(N-1)+j),((i-1)*(N-1)+j))=A(((i-1)*(N-1)+j),((i-1)*(N-1)+j))-1/(h1^2);
        else 
            A(((i-1)*(N-1)+j),((i-2)*(N-1)+j))=-1/(h1^2);
        end
        if i==N-1
            A(((i-1)*(N-1)+j),((i-1)*(N-1)+j))=A(((i-1)*(N-1)+j),((i-1)*(N-1)+j))-1/(h1^2);
        else
            A(((i-1)*(N-1)+j),(i*(N-1)+j))=-1/(h1^2);
        end
        if j~=1
            A(((i-1)*(N-1)+j),((i-1)*(N-1)+j-1))=-1/(h2^2);
        end
        if j~=N-1
            A(((i-1)*(N-1)+j),((i-1)*(N-1)+j+1))=-1/(h2^2);
        end            
    end
end
D = diag(diag(A));%求A的对角矩阵
L = -tril(A,-1);%求A的下三角矩阵
U = -triu(A,1);%求A的上三角矩阵
%Jacobi
B=D\(L+U);
g=D\b;
y_old=2*ones((N-1)^2,1);y_new=ones((N-1)^2,1);
n1=0;
while norm(y_new-y_old)/norm(y_old)>10^(-5)
    y_old=y_new;
    y_new=B*y_old+g;
    n1=n1+1;
end
y_Jacobi=y_new;

%G-S
B=(D-L)\U;
g=(D-L)\b;
y_old=2*ones((N-1)^2,1);y_new=ones((N-1)^2,1);
n2=0;
while norm(y_new-y_old)/norm(y_old)>10^(-5)
    y_old=y_new;
    y_new=B*y_old+g;
    n2=n2+1;
end
y_G_S=y_new;

%SOR w=1.45
w=1.45;
B=(D-w*L)\((1-w)*D+w*U);
g=(D-w*L)\(w*b);
y_old=2*ones((N-1)^2,1);y_new=ones((N-1)^2,1);
n3=0;
while norm(y_new-y_old)/norm(y_old)>10^(-5)
    y_old=y_new;
    y_new=B*y_old+g;
    n3=n3+1;
end
y_SOR=y_new;

L1=zeros((N-1)^2,(N-1)^2);L2=zeros((N-1)^2,(N-1)^2);
for i=1:(N-1)
    for j=1:(N-1)
        L1(((i-1)*(N-1)+j),((i-1)*(N-1)+j))=2/(h1^2);
        L2(((i-1)*(N-1)+j),((i-1)*(N-1)+j))=2/(h2^2);
        if i==1
            L1(((i-1)*(N-1)+j),((i-1)*(N-1)+j))=L1(((i-1)*(N-1)+j),((i-1)*(N-1)+j))-1/(h1^2);
        else 
            L1(((i-1)*(N-1)+j),((i-2)*(N-1)+j))=-1/(h1^2);
        end
        if i==N-1
            L1(((i-1)*(N-1)+j),((i-1)*(N-1)+j))=L1(((i-1)*(N-1)+j),((i-1)*(N-1)+j))-1/(h1^2);
        else
            L1(((i-1)*(N-1)+j),(i*(N-1)+j))=-1/(h1^2);
        end
        if j~=1
            L2(((i-1)*(N-1)+j),((i-1)*(N-1)+j-1))=-1/(h2^2);
        end
        if j~=N-1
            L2(((i-1)*(N-1)+j),((i-1)*(N-1)+j+1))=-1/(h2^2);
        end            
    end
end
I=eye((N-1)^2);

%ADI(单参)
tau=h2*h2*sqrt(1/(sin(pi*h2)*sin(pi*h2)))/2;
y_old=2*ones((N-1)^2,1);y_new=ones((N-1)^2,1);
n4=0;
while norm(y_new-y_old)/norm(y_old)>10^(-5)
    y_old=y_new;
    y_middle=(I+tau*L1)\((I-tau*L2)*y_old+tau*b);
    y_new=(I+tau*L2)\((I-tau*L1)*y_middle+tau*b);
    n4=n4+1;
end

%ADI(P个参数)
P=round(-log(tan(pi*h2/2))/log(1/(sqrt(2)-1)));
tau=zeros(P,1);
for k=1:P
    tau(k)=(sqrt(2)-1)^(2*k-1)*h2*h2/(4*sin(pi*h2/2)*sin(pi*h2/2));
end
y_old=2*ones((N-1)^2,1);y_new=ones((N-1)^2,1);
n5=0;
while norm(y_new-y_old)/norm(y_old)>10^(-5)
    y_old=y_new;
    y_middle=(I+tau(mod(n5,P)+1)*L1)\((I-tau(mod(n5,P)+1)*L2)*y_old+tau(mod(n5,P)+1)*b);
    y_new=(I+tau(mod(n5,P)+1)*L2)\((I-tau(mod(n5,P)+1)*L1)*y_middle+tau(mod(n5,P)+1)*b);
    n5=n5+1;
end
