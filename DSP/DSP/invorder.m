function [y] = invorder(x)
%invorder:FFT�еĵ���
%���ö����Ʒ�
N=length(x);M=log2(N);
%dΪ�̣�rΪ��
d=ones(1,M+1);r=ones(1,M);rr=ones(1,M);
y=ones(1,N);
for i=1:N
   %ע�⣺����������СֵΪ1
    d(1)=i-1;I=0;
   %��i-1��Ϊ�����ƣ�r(j)��ʾΪ�����Ƶĵ�jλ
   for j=1:M
       %dΪ�̣�rΪ��
       r(j)=rem(d(j),2);
       d(j+1)=fix(d(j)/2);       
   end
   %��������������
   for j=1:M
       rr(j)=r(M+1-j);
   end
   %��ԭΪʮ����
   for j=1:M
       I=I+rr(j)*2^(j-1);
   end
   I=I+1;
   y(I)=x(i);
end
end

