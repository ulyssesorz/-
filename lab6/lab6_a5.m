%5
dt=0.1;fm=1;Tm=1/fm;        %������Ƶ�ʣ���������
t=-5:dt:5;
N=length(t);
f=sinc(t);
figure;
subplot(4,1,1);plot(t,f);title('ԭ�����ź�');
for i=1:3
    fs=i*fm;                                %����Ƶ��
    Ts=1/fs;
    n=-5:Ts:5;
    F=sinc(n);                              %�����ź�
    subplot(4,1,i+1);stem(n,F,'.');
    title(['fsΪ',num2str(fs),'ʱ�ĳ����ź�']);
end

wm=2*pi*fm;
k=-N:N;
w1=k*wm/N;
F1=f*exp(-j*t'*w1)*dt;                      %����Ҷ�任��Ƶ��
figure;
subplot(4,1,1);plot(w1/(2*pi),abs(F1));
title('ԭ�źŵ�Ƶ��');
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
    title(['fsΪ',num2str(fs-1),'ʱ�ĳ����źŷ�����']);
end

figure;
subplot(4,1,1);plot(t,f);title('ԭ�����ź�');
for i=1:3
    fs=i*fm;
    Ts=1/fs;
    n=-5/Ts:5/Ts;
    t1=-5:Ts:5;
    x1=sinc(n/fs);
    T_N=ones(length(n),1)*t1-n'*Ts*ones(1,length(t1));      %t-nT����
    xa=x1*sinc(fs*pi*T_N);                                  %�ڲ幫ʽ
    subplot(4,1,i+1),plot(t1,xa);
    title(['fsΪ',num2str(fs),'ʱ���ؽ��ź�']);
end

figure;
subplot(4,1,1);plot(t,f);title('ԭ�����ź�');
N=6;
for i=1:3
    fs=i*fm;Ts=1/fs;
    n=-5:Ts:5;
    F4=sinc(n);
    wp=2*pi*fm;
    [b,a]=butter(N,wp,'s');             %������˹��
    y=lsim(b,a,F4,n);
    subplot(4,1,i+1);plot(n,y);
    title(['fsΪ',num2str(fs),'ʱ���ؽ��ź�']);
    grid on;
end
