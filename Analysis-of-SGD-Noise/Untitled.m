a=0.3;d=0.1;dd=0.01;dt=0.001;
e=0.0001;
n=ones(1,2*d/dd+1);
%syms x
%f=(x^2-1)^2;
%fplot(f,[-1.6,1.6]);
%hold on
for i=1:2*d/dd+1
    w0=-1-d+dd*(i-1);
    w=w0;n(i)=0;
    while w<1-d||w>1+d
        w=w-4*w*(w^2-1)*dt+e*random('Stable',a,0,dt^(1/a),0,1);
        n(i)=n(i)+1;
        disp(w);
        %plot(w,(w^2-1)^2,'R.');
        %hold on
    end
end
T=mean(n)*dt;
disp(e^a*T);

