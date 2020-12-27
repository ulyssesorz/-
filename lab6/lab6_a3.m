%3
xn=[1,0.5,0,0.5,1,1,0.5,0];
N=length(xn);
n=0:N-1;
Xk=fft(xn,N);           %fft
xn1=ifft(Xk,N);         %ifft
figure;
subplot(2,1,1);stem(n,abs(Xk),'.');title('dftͼ��');
subplot(2,1,2);stem(n,xn1,'.');title('idftͼ��');

Fs=20;
for N1=[8,32,64]
    D=2*pi*Fs/N1;                   %�ֱ���
    k=floor(-(N1-1)/2:(N1-1)/2);    %Ƶ����ʾ��ΧΪ[-pi,pi]
    X=fftshift(fft(xn,N1));
    figure;
    subplot(2,1,1);plot(k*D,abs(X),'.:');
    title(['����Ϊ',num2str(N1),'��fft�������']);
    subplot(2,1,2);plot(k*D,angle(X),'.:');
    title(['����Ϊ',num2str(N1),'��fft����λ��']);
end
