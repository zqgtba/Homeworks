function [X] = DIT_FFT(F,N,T,Z)
%DIT_FFT ʱ���ȡ����2FFT
%1.���� 2.���� 3.�ּ� 4.ȷ����ת���� 5.�������� 6.��ͼ
%�ȶ����Һ�������
x=dsin(F,N,T,Z);
M=log2(N+Z);
%�Բ���������е���
A=invorder(x);
%LΪ���㼶��?
for L=1:M
   %BΪ��L������ת������
   B=2^(L-1);
   for J=1:B
       P=2^(M-L)*(J-1);
       %���ÿ����ת���ӽ��е�������
       for k=J:2^L:J+(N+Z)-2^L
           T=A(k)+A(k+B)*exp(-1i*2*pi*P/(N+Z));
           A(k+B)=A(k)-A(k+B)*exp(-1i*2*pi*P/(N+Z));
           A(k)=T;
       end
   end
end
X=A;
H=max(abs(X));
%��ͼ
figure(2)
for i=1:N+Z
    plot(i-1,abs(X(i))/H,'k.');
    hold on
end
end

