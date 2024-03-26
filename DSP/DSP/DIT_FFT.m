function [X] = DIT_FFT(F,N,T,Z)
%DIT_FFT 时域抽取法基2FFT
%1.采样 2.倒序 3.分级 4.确定旋转因子 5.蝶形运算 6.作图
%先对正弦函数采样
x=dsin(F,N,T,Z);
M=log2(N+Z);
%对采样后的序列倒序
A=invorder(x);
%L为运算级数?
for L=1:M
   %B为第L级的旋转因子数
   B=2^(L-1);
   for J=1:B
       P=2^(M-L)*(J-1);
       %针对每个旋转因子进行蝶形运算
       for k=J:2^L:J+(N+Z)-2^L
           T=A(k)+A(k+B)*exp(-1i*2*pi*P/(N+Z));
           A(k+B)=A(k)-A(k+B)*exp(-1i*2*pi*P/(N+Z));
           A(k)=T;
       end
   end
end
X=A;
H=max(abs(X));
%作图
figure(2)
for i=1:N+Z
    plot(i-1,abs(X(i))/H,'k.');
    hold on
end
end

