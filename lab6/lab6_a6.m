%6
Ts=1;N0=[3,5,10];
for i=1:3
    N=N0(i);
    D=2*pi/(Ts*N);              %分辨率
    kn=floor(-(N-1)/2:-1/2);    %负频率向量
    kp=floor(0:(N-1)/2);        %正频率向量
    w=[kp,kn]*D;
    X=2+4*exp(-j*w)+6*exp(-2*j*w)+4*exp(-3*j*w)+2*exp(-4*j*w);
    n=0:N-1;
    x=ifft(X,N);
    subplot(3,1,i);stem(n*Ts,abs(x),'.');
    title(['抽样点数为',num2str(N),'时的时间序列']);
end
