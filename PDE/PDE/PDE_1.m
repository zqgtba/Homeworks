tic
h=0.1;nx=1/h-1;ny=1/h-1;S=h^2/2;m=nx;
u=zeros(nx,ny);uu=zeros(nx*ny,1);u_real=zeros(m,m);
xx=zeros(nx,ny);yy=zeros(nx,ny);
A=zeros(nx*ny,nx*ny);b=zeros(nx*ny,1);
syms x y
f=(2+pi*pi*x*(1-x))*sin(pi*y);
for i=1:nx
    for j=1:ny
        xx(i,j)=i*h;
        yy(i,j)=j*h;
    end
end
for i=1:nx
    for j=1:ny
        
        ai=(xx(i,j)-h)*(yy(i,j)-h)-xx(i,j)*yy(i,j);
        bi=h;ci=h;
        Li=((ai+bi*x+ci*y)/(2*S));
%       b1=double(int(int(f*Li,y,(yy(i,j)+xx(i,j)-h-x),yy(i,j)),x,(xx(i,j)-h),xx(i,j)));
        b1=vpa(subs(f*Li,{x,y},{xx(i,j)-3*h/8,yy(i,j)-3*h/8}))*S;

        ai=xx(i,j)*(yy(i,j)-h)-(xx(i,j)+h)*(yy(i,j)-h);
        bi=0;ci=h;
        Li=((ai+bi*x+ci*y)/(2*S));
%       b2=double(int(int(f*Li,y,(yy(i,j)-h),(yy(i,j)+xx(i,j)-x)),x,xx(i,j),(xx(i,j)+h)));
        b2=vpa(subs(f*Li,{x,y},{xx(i,j)+3*h/8,yy(i,j)-5*h/8}))*S;

        ai=(xx(i,j)+h)*yy(i,j)-(xx(i,j)+h)*(yy(i,j)-h);
        bi=-h;ci=0;
        Li=((ai+bi*x+ci*y)/(2*S));
%       b3=double(int(int(f*Li,y,(yy(i,j)+xx(i,j)-x),yy(i,j)),x,xx(i,j),(xx(i,j)+h)));
        b3=vpa(subs(f*Li,{x,y},{xx(i,j)+5*h/8,yy(i,j)-3*h/8}))*S;
        
        ai=(xx(i,j)+h)*(yy(i,j)+h)-xx(i,j)*yy(i,j);
        bi=-h;ci=-h;
        Li=((ai+bi*x+ci*y)/(2*S));
%       b4=double(int(int(f*Li,y,yy(i,j),(xx(i,j)+yy(i,j)+h-x)),x,xx(i,j),(xx(i,j)+h)));
        b4=vpa(subs(f*Li,{x,y},{xx(i,j)+3*h/8,yy(i,j)+3*h/8}))*S;
        
        ai=xx(i,j)*(yy(i,j)+h)-(xx(i,j)-h)*(yy(i,j)+h);
        bi=0;ci=-h;
        Li=((ai+bi*x+ci*y)/(2*S));
%       b5=double(int(int(f*Li,y,(yy(i,j)+xx(i,j)-x),(yy(i,j)+h)),x,(xx(i,j)-h),xx(i,j)));
        b5=vpa(subs(f*Li,{x,y},{xx(i,j)-3*h/8,yy(i,j)+5*h/8}))*S;
        
        ai=(xx(i,j)-h)*yy(i,j)-(xx(i,j)-h)*(yy(i,j)+h);
        bi=h;ci=0;
        Li=((ai+bi*x+ci*y)/(2*S));
%       b6=double(int(int(f*Li,y,yy(i,j),(yy(i,j)+xx(i,j)-x)),x,(xx(i,j)-h),xx(i,j)));
        b6=vpa(subs(f*Li,{x,y},{xx(i,j)-5*h/8,yy(i,j)+3*h/8}))*S;
        
        b((i-1)*ny+j)=b1+b2+b3+b4+b5+b6;
%       A((i-1)*ny+j,(i-1)*ny+j)=2*h^2/S;
    end
end
for i=1:m
    for j=1:m
        for i1=1:m
            for j1=1:m
if(i==i1&&j==j1)
    A(j+(i-1)*m,j1+(i1-1)*m)=(8*h*h)/(4*S);
else
    if(abs(i-i1)+abs(j-j1)==1)
    A(j+(i-1)*m,j1+(i1-1)*m)=-(2*h*h)/(4*S);
    else
        if(abs(i-i1)+abs(j-j1)==2&&i-i1+j-j1==0)
            A(j+(i-1)*m,j1+(i1-1)*m)=0;
        else
             A(j+(i-1)*m,j1+(i1-1)*m)=0;
        end
    end
end
            end
        end
    end
end
uu=A\b;
sum1=0;
sum2=0;
uu_real=zeros(m^2,1);
for i=1:m
    for j=1:m
        u(i,j)=uu(j+(i-1)*m);
        u_real(i,j)=i*h*(1-i*h)*sin(pi*j*h);
        uu_real(j+(i-1)*m)=i*h*(1-i*h)*sin(pi*j*h);
        sum1=sum1+(u_real(i,j)-u(i,j))^2;
    end
end
for k=2:m^2
    sum2=sum2+((uu_real(k)-uu(k))-(uu_real(k-1)-uu(k-1)))^2;
end
sum1=sqrt(h*sum1);
sum2=sqrt(sum2/h);
toc