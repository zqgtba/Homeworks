%[0,a]的均匀分布，样本量为n
n=10;a=1;
%分别计算矩估计a_m,极大似然估计a_ml,UMVUE a_um,Pitman估计a_p,
%以及先验分布为（0，1）上均匀分布的贝叶斯估计a_b，重复500次，次数记为k
X=0:500;
Y=1;
plot(X,Y,'k.');
hold on
aa=a*ones(1,500);
a_m=ones(1,500);
a_ml=ones(1,500);
a_um=ones(1,500);
a_p=ones(1,500);
a_b=ones(1,500);
for k=1:500
 x=a*rand(1,n);
 a_m(k)=2*sum(x)/n;
 plot(k,a_m(k),'r.');
 hold on
 a_ml(k)=max(x);
 plot(k,a_ml(k),'g.');
 hold on
 a_um(k)=(n+1)*max(x)/n;
 plot(k,a_um(k),'b.');
 hold on
 a_p(k)=(n+2)*max(x)/(n+1);
 plot(k,a_p(k),'y.');
 hold on
 a_b(k)=(n+1)*max(x)*(max(x)^n-1)/n/(max(x)^(n+1)-1);
 plot(k,a_b(k),'m.') 
end
disp('均值分别为：')
disp(mean(a_m));disp(mean(a_ml));disp(mean(a_um));disp(mean(a_p));disp(mean(a_b));
disp('方差分别为：')
disp(var(a_m));disp(var(a_ml));disp(var(a_um));disp(var(a_p));disp(var(a_b));
disp('MSE分别为：')
disp(sum((a_m-aa).^2)./499);disp(sum((a_ml-aa).^2)./499);disp(sum((a_um-aa).^2)./499);disp(sum((a_p-aa).^2)./499);disp(sum((a_b-aa).^2)./499);
axis([0 501 0.3 1.7]);