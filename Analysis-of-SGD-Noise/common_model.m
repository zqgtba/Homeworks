b=0;
syms x
f=(-sign(x)+1)/2*(x+1)^2+(sign(x)+1)/2*(b*x^2-(b+1)*x+1)+(sign(x-1)+1)/2*((2-2*b)*x+2*b-2);
fplot(f,[-2,2]);
hold on
grid

a=1;d=0.1;dd=0.01;dt=0.1;
e=0.1;
grad_f=gradient(f);
n1=ones(1,2*d/dd+1);
for i=1:2*d/dd+1
    w0=-1-d+dd*(i-1);
    w=w0;n1(i)=0;
    while abs(vpa(w)-1)>0.1
        w=w-subs(grad_f,w)*dt+e*random('Stable',a,0,dt^(1/a),0,1);
        n1(i)=n1(i)+1;
        disp(vpa(w));
        %plot(vpa(w),subs(f,w),'r.');
    end
end
T1=mean(n1)*dt;

n2=ones(1,2*d/dd+1);
for i=1:2*d/dd+1
    w0=b-d+dd*(i-1);
    w=w0;n2(i)=0;
    while abs(vpa(w)+1)>0.1
        w=w-subs(grad_f,w)*dt+e*random('Stable',a,0,dt^(1/a),0,1);
        n2(i)=n2(i)+1;
        disp(vpa(w));
        %plot(vpa(w),subs(f,w),'r.');
    end
end
T2=mean(n2)*dt;
disp(e^a*T1);
disp(e^a*T2);
disp(T2/T1);