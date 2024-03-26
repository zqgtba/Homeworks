function [Q,R] = QR(A)
m=size(A,1);
n=size(A,2);
d=ones(n,1)-ones(n,1);
for j=1:n
    if j<m
        [v,b]=house(A(j:m,j));
        A(j:m,j:n)=(eye(m-j+1)-b*(v*v'))*A(j:m,j:n);
        d(j)=b;
        A(j+1:m,j)=v(2:m-j+1);
    end
end
Q=eye(m);
for k=1:n
    vk=ones(m-k+1,1);
    if m-k+1>1
    vk(2:m-k+1)=A(k+1:m,k);
    end
    hk=eye(m-k+1)-d(k)*(vk*vk');
    Hk=eye(m);
    Hk(k:m,k:m)=hk;
    Q=Q*Hk;
end
R=eye(n);
for i=1:n
    R(1:i,i)=A(1:i,i);
end
end

