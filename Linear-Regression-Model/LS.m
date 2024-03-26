function [x] = LS(A,b)
m=size(A,1);
n=size(A,2);
[Q,R]=QR(A);
c=Q'*b;
c1=c(1:n);
x=R\c1;
end

