A=[10 1 2 3 4;1 9 -1 2 -3;2 -1 7 3 -5;3 2 3 12 -1;4 -3 -5 -1 15];
b=[12;-27;14;-17;12];
x=A\b;
D = diag(diag(A));%求A的对角矩阵
L = -tril(A,-1);%求A的下三角矩阵
U = -triu(A,1);%求A的上三角矩阵

%Jacobi
B=D\(L+U);
g=D\b;
x_new=ones(5,1);
n1=0;
while norm(b-A*x_new)>10^(-6)
    x_old=x_new;
    x_new=B*x_old+g;
    n1=n1+1;
end
x_Jacobi=x_new;

%G-S
B=(D-L)\U;
g=(D-L)\b;
x_new=ones(5,1);
n2=0;
while norm(b-A*x_new)>10^(-6)
    x_old=x_new;
    x_new=B*x_old+g;
    n2=n2+1;
end
x_G_S=x_new;

%CG
x_old=ones(5,1);r_old=b-A*x_old;
n3=0;
while norm(b-A*x_old)>10^(-6)
    n3=n3+1;
    if n3==1
        p_old=r_old;
    else
        beta=r_new'*r_new/(r_old'*r_old);
        p_new=r_new+beta*p_old;
        p_old=p_new;r_old=r_new;
    end
    alpha=r_old'*r_old/(p_old'*A*p_old);
    x_new=x_old+alpha*p_old;
    r_new=r_old-alpha*A*p_old;
    x_old=x_new;
    disp(x_new);
end
x_CG=x_new;