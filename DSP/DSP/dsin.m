function [x] = dsin(F,N,T,Z)
%dsin:对正弦函数采样
%信号频率为F，采样长为N，采样时间为T,补零个数为Z
x=ones(0,N+Z);
for i=1:N
    x(i)=sin(2*pi*F*T*(i-1));
    %plot(i-1,x(i),'k.');
    %hold on
end
if Z>0
for i=N+1:N+Z
    x(i)=0;
    %plot(i-1,x(i),'k.');
    %hold on
end
end
end

