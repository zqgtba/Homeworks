b=0;
syms x
f=(x-2)^2/4+b;
g=(b+1)*(x+1)^2;
fplot(f,[0,4]);
hold on
fplot(g,[-2,0]);
axis([-2.5 4.5 -0.5 b+1.5])
grid

a=1;d=0.1;dd=0.01;dt=0.01;
e=0.01;
n1=ones(1,2*d/dd+1);
for i=1:2*d/dd+1
    w0=-1-d+dd*(i-1);
    w=w0;n1(i)=0;
    while w<2-d||w>2+d
        if w>0
            w=w-0.5*(w-2)*dt+e*random('Stable',a,0,dt^(1/a),0,1);
        else
            w=w-2*(b+1)*(w+1)*dt+e*random('Stable',a,0,dt^(1/a),0,1);
        end
        n1(i)=n1(i)+1;
        %disp(w);
    end
end
T1=mean(n1)*dt;

n2=ones(1,2*d/dd+1);
for i=1:2*d/dd+1
    w0=2-d+dd*(i-1);
    w=w0;n2(i)=0;
    while w<-1-d||w>-1+d
        if w>0
            w=w-0.5*(w-2)*dt+e*random('Stable',a,0,dt^(1/a),0,1);
        else
            w=w-2*(b+1)*(w+1)*dt+e*random('Stable',a,0,dt^(1/a),0,1);
        end
        n2(i)=n2(i)+1;
        %disp(w);
    end
end
T2=mean(n2)*dt;
disp(e^a*T1);
disp(e^a*T2);
disp(T2/T1);