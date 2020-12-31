%3
fp1=0.2;fp2=0.3;  %通带截止频率(归一化)
fs1=0.15;fs2=0.35;  %阻带截止频率(归一化)
wp1=fp1*2*pi;wp2=fp2*2*pi;
ws1=fs1*2*pi;ws2=fs2*2*pi;
rp=1;as=20;             %衰减指标
Fs=1000;T=1/Fs;
omgp1=(2/T)*tan(wp1/2);omgp2=(2/T)*tan(wp2/2);
omgp=[omgp1,omgp2];
omgs1=(2/T)*tan(ws1/2);omgs2=(2/T)*tan(ws2/2);
omgs=[omgs1,omgs2];
bw=omgp2-omgp1;w0=sqrt(omgp1*omgp2);        %带宽和中心频率
[n,omgn]=cheb2ord(omgp,omgs,rp,as,'s');                           
[z0,p0,k0]=cheb2ap(n,as);       %归一化滤波器原型
ba1=k0*real(poly(z0))       %滤波器系数
aa1=real(poly(p0))
[ba,aa]=lp2bp(ba1,aa1,w0,bw);       %变换为带通型
[bd,ad]=bilinear(ba,aa,Fs);
[H,omg]=freqz(bd,ad);       %求频率响应
figure;
subplot(2,1,1);plot(omg/pi,abs(H));grid on;
title('切比雪夫2型带通滤波器幅频响应特性');
subplot(2,1,2);plot(omg/pi,angle(H));grid on;
title('切比雪夫2型带通滤波器相频响应特性');
figure;pzmap(ba1,aa1);axis square axis equal;grid on;
