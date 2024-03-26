function [r]=Implicit_QR(A)
[~,n]=size(A);
[~,H] = Hessenberg(A);
u=10e-5; 
for  i=2:n     
    if  abs( H(i,i-1))<=(abs(H(i,i))+ abs(H(i-1,i-1)))*u        
        H(i,i-1)=0;     
    end
end
H22=H; 
x=Ifschur(H22); 
while x==1     
    [~,H22]=QR_Iteration(H22); 
    for  i=2:n     
        if  abs( H22(i,i-1))<=(abs(H22(i,i))+ abs(H22(i-1,i-1)))*u        
            H22(i,i-1)=0;     
        end
    end
    x=Ifschur(H22);
end
[r]=EigValue(H22);
r=r';
end