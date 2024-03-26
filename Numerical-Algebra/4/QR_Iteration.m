function [Q,H]=QR_Iteration(A)
%QR迭代 
H=A; 
[~,n]=size(H); 
a=n-2;
m=n-1; 
s=H(m,m)+H(n,n); 
t=H(m,m)*H(n,n)-H(m,n)*H(n,m); 
x=H(1,1)*H(1,1)+H(1,2)*H(2,1)-s* H(1,1)+t; 
y=H(2,1)*(H(1,1)+H(2,2)-s); 
z=H(2,1)*H(3,2); 
Q=eye(n);
for k=0:n-3  
    Pk=eye(n);
    [v,b]=house([x,y,z]');   
    q=max(1,k);     
    H(k+1:k+3,q:n)=(eye(3)-b*v*v')* H(k+1:k+3,q:n);
    pk=eye(3)-b*v*v';
    Pk(k+1:k+3,k+1:k+3)=pk(1:3,1:3);
    if k<a+1
        Q=Q*Pk;
    end
    r=min(k+4,n);     
    H(1:r,k+1:k+3)= H(1:r,k+1:k+3)*(eye(3)-b*v*v');     
    x=H(k+2,k+1);     
    y=H(k+3,k+1);     
    if  k<n-3       
        z=H(k+4,k+1);     
    end
end
[v,b]=house([x,y]');
Pk=eye(n);
pk=eye(2)-b*v*v';
Pk(n-1:n,n-1:n)=pk(1:2,1:2);
if n-2<a+1
    Q=Q*Pk;
end
H(n-1:n,n-2:n)=(eye(2)-b*v*v')*H(n-1:n,n-2:n);
H(1:n,n-1:n)=H(1:n,n-1:n)*(eye(2)-b*v*v');

