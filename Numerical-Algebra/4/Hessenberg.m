function [Q,H] = Hessenberg(A)
%Hessenberg分解 
H=A;
[~,n]=size(H); 
for k=1:n-2     
    [v,b]=house(H(k+1:n,k));     
    H1=eye(n-k)-b*v*v';     
    H2=eye(n);     
    for  i=k+1:n        
        for  j=k+1:n            
            H2(i,j)=H1(i-k,j-k);        
        end
    end
    if k==1    
        Q=H2;     
    else
        Q=Q*H2;
    end
    H(k+1:n,k:n)=H1*H(k+1:n,k:n);     
    H(1:n,k+1:n)= H(1:n,k+1:n)*H1; 
end
end

