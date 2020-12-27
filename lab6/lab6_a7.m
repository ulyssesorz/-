%7
wm=6.28;wc=3.14;
N=40;                       %抽样点数
Ts=pi/wm;                   %采样周期
n=-(N-1)/2:(N-1)/2;
D=2*pi/(Ts*N);
M=floor(wc/D);
X=[zeros(1,M),1,zeros(1,N-2*M-1),1,zeros(1,M-1)]
subplot(2,1,1);stem(n,X,'.');title('频谱');
xa=abs(fftshift(ifft(X,N)));
subplot(2,1,2);plot(n*Ts,xa);title('连续信号图像');
