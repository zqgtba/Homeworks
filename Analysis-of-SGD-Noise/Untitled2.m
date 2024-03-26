b=2;
syms x y
f=((x-2)^2/4+b)*(sign(x)+1)/2+(b+1)*(x+1)^2*(-sign(x)+1)/2+(x+y-1)^2;
fsurf(f,[-3 3 -3 3]);
hold on
subs(f,[x,y],[-1,2])
subs(f,[x,y],[2,-1])

a=0.5;d=0.2;dd=0.2;dt=0.05;
e=0.01;
grad_f=gradient(f,[x,y]);
n1=ones(2*d/dd+1,2*d/dd+1);
for i=1:2*d/dd+1
    for j=1:2*d/dd+1
        w0=[-1-d+dd*(i-1),2-d+dd*(j-1)];
        w=w0;n1(i,j)=0;
        while norm(w-[2,-1])>d
            w=w-subs(grad_f,[x,y],w)'*dt+e*[random('Stable',a,0,dt^(1/a),0,1),random('Stable',a,0,dt^(1/a),0,1)];
            n1(i,j)=n1(i,j)+1;
            %disp(vpa(w));
        end
    end
end
T1=mean(n1(:))*dt;

n2=ones(2*d/dd+1,2*d/dd+1);
for i=1:2*d/dd+1
    for j=1:2*d/dd+1
        w0=[2-d+dd*(i-1),-1-d+dd*(j-1)];
        w=w0;n2(i,j)=0;
        while norm(w-[-1,2])>d
            w=w-subs(grad_f,[x,y],w)'*dt+e*[random('Stable',a,0,dt^(1/a),0,1),random('Stable',a,0,dt^(1/a),0,1)];
            n2(i,j)=n2(i,j)+1;
            %disp(vpa(w));
        end
    end
end
T2=mean(n2(:))*dt;
disp(e^a*T1);
disp(e^a*T2);
disp(T2/T1);
