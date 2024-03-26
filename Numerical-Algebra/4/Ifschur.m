function [x]=Ifschur(A)
%判断是否已经schur形 x=1表示还不是schur形，x=0表示已经是schur形 
%y用来储存A次对角线元素 
%z用来储存y元素为零的角标 
[~,n]=size(A); 
y=zeros(1,n-1); 
x=1; 
for i=1:n-1     
    y(i)=A(i+1,i); 
end
m=0;
for i=1:n-1     
    if abs(y(i)-0)<1e-5         
        m=m+1;              
    end
end
if m==0     
    x=1; 
else
    z=zeros(1,m);
    j=1; 
    i=1; 
    while(i<n)     
        if abs(y(i)-0)<1e-5         
            z(j)=i;         
            j=j+1;     
        end
        i=i+1;
    end
    i=1; 
    while(i<m)     
        if z(i+1)-z(i)>2         
            x=1;         
            break;          
        end
        i=i+1;   
    end
    if i>=m     
        x=0; 
    end
end

end

