%4
xn=[0,1,2,3,2,1,0];
N=length(xn);
xn=[xn,xn];                     %两个周期
n=0:2*N-1;
k=0:2*N-1;
Xk=xn*exp(-j*2*pi/N).^(n'*k);   %傅里叶级数变换
figure;
subplot(2,1,1);stem(k,abs(Xk),'.');title('幅度频谱')
subplot(2,1,2);stem(k,angle(Xk),'.');title('相位频谱');

x=(Xk*exp(j*2*pi/N).^(n'*k))/N;         %逆变换
figure;
subplot(2,1,1);stem(n,xn,'.');title('原图形');
subplot(2,1,2);stem(n,x,'.');title('逆变换的图形');
