%4
Ts=0.2;Fs=1/Ts;
for N=[8,32,64]
    n=0:N-1;
    xn=0.5.^n;
    D=2*pi*Fs/N;                   %分辨率
    k=floor(-(N-1)/2:(N-1)/2);    %频率显示范围为[-pi,pi]
    X=fftshift(fft(xn,N));
    figure;
    subplot(2,1,1);plot(k*D,abs(X),'.:');
    title(['长度为',num2str(N),'的fft求幅度谱']);
    subplot(2,1,2);plot(k*D,angle(X),'.:');
    title(['长度为',num2str(N),'的fft求相位谱']);
end
