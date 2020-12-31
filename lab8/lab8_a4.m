%4
wp1=0.35*pi;wp2=0.65*pi;
ws1=0.4*pi;ws2=0.6*pi;
rp=1;as=20;             %衰减指标
T=0.1;Fs=1/T;
omgp1=(2/T)*tan(wp1/2);omgp2=(2/T)*tan(wp2/2);
omgp=[omgp1,omgp2];
omgs1=(2/T)*tan(ws1/2);omgs2=(2/T)*tan(ws2/2);
omgs=[omgs1,omgs2];
bw=omgp2-omgp1;w0=sqrt(omgp1*omgp2);        %带宽和中心频率
[n,omgn]=ellipord(omgp,omgs,rp,as,'s');                           
[z0,p0,k0]=ellipap(n,rp,as);       %归一化滤波器原型
ba1=k0*real(poly(z0))       %滤波器系数
aa1=real(poly(p0))
[ba,aa]=lp2bs(ba1,aa1,w0,bw);       %变换为带阻型
[bd,ad]=bilinear(ba,aa,Fs);
[H,omg]=freqz(bd,ad);       %求频率响应
figure;
subplot(2,1,1);plot(omg/pi,abs(H));grid on;
title('椭圆带阻滤波器幅频响应特性');
subplot(2,1,2);plot(omg/pi,angle(H));grid on;
title('椭圆带阻滤波器相频响应特性');
figure;pzmap(ba1,aa1);axis square axis equal;grid on;