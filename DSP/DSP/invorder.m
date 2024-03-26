function [y] = invorder(x)
%invorder:FFT中的倒序
%采用二进制法
N=length(x);M=log2(N);
%d为商，r为余
d=ones(1,M+1);r=ones(1,M);rr=ones(1,M);
y=ones(1,N);
for i=1:N
   %注意：数组索引最小值为1
    d(1)=i-1;I=0;
   %将i-1化为二进制，r(j)表示为二进制的第j位
   for j=1:M
       %d为商，r为余
       r(j)=rem(d(j),2);
       d(j+1)=fix(d(j)/2);       
   end
   %将二进制数倒序
   for j=1:M
       rr(j)=r(M+1-j);
   end
   %还原为十进制
   for j=1:M
       I=I+rr(j)*2^(j-1);
   end
   I=I+1;
   y(I)=x(i);
end
end

