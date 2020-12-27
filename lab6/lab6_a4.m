%4
Ts=0.2;Fs=1/Ts;
for N=[8,32,64]
    n=0:N-1;
    xn=0.5.^n;
    D=2*pi*Fs/N;                   %�ֱ���
    k=floor(-(N-1)/2:(N-1)/2);    %Ƶ����ʾ��ΧΪ[-pi,pi]
    X=fftshift(fft(xn,N));
    figure;
    subplot(2,1,1);plot(k*D,abs(X),'.:');
    title(['����Ϊ',num2str(N),'��fft�������']);
    subplot(2,1,2);plot(k*D,angle(X),'.:');
    title(['����Ϊ',num2str(N),'��fft����λ��']);
end
