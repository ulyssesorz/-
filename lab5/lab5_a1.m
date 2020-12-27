%1
k=1;
z1=[0.3]';
p1=[-0.5+0.7j,-0.5-0.7j]';          %列出零极点
z2=[0.3]';
p2=[-0.6+0.8j,-0.6-0.8j]';
z3=[0.3]';
p3=[-1+j,-1-j]';
figure;
subplot(3,1,1);zplane(z1,p1);       %画零极点图
subplot(3,1,2);zplane(z2,p2);
subplot(3,1,3);zplane(z3,p3);

[b1,a1]=zp2tf(z1,p1,k);             %转化为系统传递函数模型
[b2,a2]=zp2tf(z2,p2,k);
[b3,a3]=zp2tf(z3,p3,k);
figure;
subplot(3,1,1);impz(b1,a1,30);      %冲激响应
subplot(3,1,2);impz(b2,a2,30);
subplot(3,1,3);impz(b3,a3,30);
