%5
dt=0.1;fm=1;Tm=1/fm;        %基波的频率，计算周期
t=-5:dt:5;
N=length(t);
f=sinc(t);
figure;
subplot(4,1,1);plot(t,f);title('原连续信号');
for i=1:3
    fs=i*fm;                                %采样频率
    Ts=1/fs;
    n=-5:Ts:5;
    F=sinc(n);                              %抽样信号
    subplot(4,1,i+1);stem(n,F,'.');
    title(['fs为',num2str(fs),'时的抽样信号']);
end

wm=2*pi*fm;
k=-N:N;
w1=k*wm/N;
F1=f*exp(-j*t'*w1)*dt;                      %傅里叶变换求频谱
figure;
subplot(4,1,1);plot(w1/(2*pi),abs(F1));
title('原信号的频谱');
for i=1:3
    if i<=2 c=0,else c=1,end
    fs=(i+1)*fm;
    Ts=1/fs;
    n=-5:Ts:5;  
    F2=sinc(n);
    N=length(n);
    k=-N:N;
    w=k*wm/N;
    F3=F2*exp(-j*n'*w)*Ts;
    subplot(4,1,i+1);plot(w/(2*pi),abs(F3));
    title(['fs为',num2str(fs-1),'时的抽样信号幅度谱']);
end

figure;
subplot(4,1,1);plot(t,f);title('原连续信号');
for i=1:3
    fs=i*fm;
    Ts=1/fs;
    n=-5/Ts:5/Ts;
    t1=-5:Ts:5;
    x1=sinc(n/fs);
    T_N=ones(length(n),1)*t1-n'*Ts*ones(1,length(t1));      %t-nT矩阵
    xa=x1*sinc(fs*pi*T_N);                                  %内插公式
    subplot(4,1,i+1),plot(t1,xa);
    title(['fs为',num2str(fs),'时的重建信号']);
end

figure;
subplot(4,1,1);plot(t,f);title('原连续信号');
N=6;
for i=1:3
    fs=i*fm;Ts=1/fs;
    n=-5:Ts:5;
    F4=sinc(n);
    wp=2*pi*fm;
    [b,a]=butter(N,wp,'s');             %巴特沃斯型
    y=lsim(b,a,F4,n);
    subplot(4,1,i+1);plot(n,y);
    title(['fs为',num2str(fs),'时的重建信号']);
    grid on;
end
