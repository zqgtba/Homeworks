function [y] = untitled3(n,h,x1,y1,f)
%��׼4��4��R-K��
%���뵼��f(x,y)  ��ֵx1,y1  ����h  �ڵ���n+1

%ʹ��x��y������������xi��yi��ֵ
x=1:n+1;
y=1:n+1;
x(1)=x1;
y(1)=y1;

%ѭ������
for i=1:n
    K1=h*f(x(i),y(i));
    K2=h*f(x(i)+0.5*h,y(i)+0.5*K1);
    K3=h*f(x(i)+0.5*h,y(i)+0.5*K2);
    K4=h*f(x(i)+h,y(i)+K3);
    y(i+1)=y(i)+(K1+2*K2+2*K3+K4)/6;
end
end

