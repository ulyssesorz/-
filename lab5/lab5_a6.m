%6
xn=[7,6,5,4,3,2];
N=length(xn);
n=0:N-1;
k=0:N-1;
Xk=xn*exp(-j*2*pi/N).^(n'*k);           %傅里叶变换
figure;
subplot(2,1,1);stem(n,abs(Xk),'.');title('幅度谱');
subplot(2,1,2);stem(n,angle(Xk),'.');title('相位谱');

x=(Xk*exp(j*2*pi/N).^(n'*k))/N;       %傅里叶逆变换
figure;
subplot(2,1,1);stem(n,xn,'.');title('原信号图像');
subplot(2,1,2);stem(n,x,'.');title('逆变换图像');
