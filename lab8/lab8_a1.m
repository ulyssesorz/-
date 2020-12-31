%1
wp1=0.3*pi;wp2=0.7*pi;  %通带截止频率
ws1=0.1*pi;ws2=0.9*pi;  %阻带截止频率
rp=1;as=15;             %衰减指标
fs=2000;T=1/fs;
omgp1=wp1*fs;omgp2=wp2*fs;omgp=[omgp1,omgp2];
omgs1=ws1*fs;omgs2=ws2*fs;omgs=[omgs1,omgs2];
bw=omgp2-omgp1;w0=sqrt(omgp1*omgp2);        %带宽和中心频率
[n,omgn]=buttord(omgp,omgs,rp,as,'s');                           
[z0,p0,k0]=buttap(n);       %归一化滤波器原型
ba1=k0*real(poly(z0))       %滤波器系数
aa1=real(poly(p0))
[ba,aa]=lp2bp(ba1,aa1,w0,bw);       %变换为带通型
[bd,ad]=impinvar(ba,aa,fs);
[H,omg]=freqz(bd,ad);       %求频率响应
figure;
subplot(2,1,1);plot(omg/pi,abs(H));grid on;
title('巴特沃斯带通滤波器幅频响应特性');
subplot(2,1,2);plot(omg/pi,angle(H));grid on;
title('巴特沃斯带通滤波器相频响应特性');
figure;pzmap(ba1,aa1);axis square axis equal;grid on;
