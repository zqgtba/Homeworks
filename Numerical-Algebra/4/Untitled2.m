A=zeros(41,41);
A(1,38)=-1;A(1,41)=-1;
for i=2:41
    A(i,i-1)=1;
end
% [r1]=Implicit_QR(A);
disp(eig(A));

x=0.9;
B=[9.1 3.0 2.6 4.0;4.2 5.3 4.7 1.6;3.2 1.7 9.4 x;6.1 4.9 3.5 6.2];
[r2]=Implicit_QR(B);
% disp(r2);
disp(eig(B))
x=1.0;
B=[9.1 3.0 2.6 4.0;4.2 5.3 4.7 1.6;3.2 1.7 9.4 x;6.1 4.9 3.5 6.2];
[r3]=Implicit_QR(B);
disp(r3);
% disp(eig(B));
x=1.1;
B=[9.1 3.0 2.6 4.0;4.2 5.3 4.7 1.6;3.2 1.7 9.4 x;6.1 4.9 3.5 6.2];
[r4]=Implicit_QR(B);
disp(r4);
% disp(eig(B));