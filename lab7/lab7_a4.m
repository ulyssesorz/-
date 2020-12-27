%4
fp=6000;omgp=2*pi*fp;
fs=15000;omgs=2*pi*fs;
rp=1;as=30;

[n,omgc]=buttord(omgp,omgs,rp,as,'s');  %低通滤波器原型
[z0,p0,k0]=buttap(n);
b0=k0*real(poly(z0));                   %滤波器系数
a0=real(poly(p0));
[H0,omg0]=freqs(b0,a0);                   %频率特性
pb0=poly2str(b0,'s')                    %显示多项式
pa0=poly2str(a0,'s')
figure;
subplot(2,1,1);plot(omg0*omgc/(2*pi),abs(H0));grid on;
title('巴特沃斯滤波器幅频响应特性');axis([0,16000,0,1.1]);
subplot(2,1,2);plot(omg0*omgc/(2*pi),angle(H0));grid on;
title('巴特沃斯滤波器相频响应特性');axis([0,16000,-4,4]);
figure;pzmap(b0,a0);axis square axis equal;grid on;

[n1,omgn1]=cheb1ord(omgp,omgs,rp,as,'s');
[z1,p1,k1]=cheb1ap(n,rp);
b1=k1*real(poly(z1));
a1=real(poly(p1));
[H1,omg1]=freqs(b1,a1);
pb1=poly2str(b1,'s')
pa1=poly2str(a1,'s')
figure;
subplot(2,1,1);plot(omg1*omgn1/(2*pi),abs(H1));grid on;
title('切比雪夫一型滤波器幅频响应特性');axis([0,16000,0,1.1]);
subplot(2,1,2);plot(omg1*omgn1/(2*pi),angle(H1));grid on;
title('切比雪夫一型滤波器相频响应特性');axis([0,16000,-4,4]);
figure;pzmap(b1,a1);axis square;axis equal;grid on;

[n2,omgn2]=cheb2ord(omgp,omgs,rp,as,'s');
[z2,p2,k2]=cheb2ap(n,as);
b2=k2*real(poly(z2));
a2=real(poly(p2));
[H2,omg2]=freqs(b2,a2);
pb2=poly2str(b2,'s')
pa2=poly2str(a2,'s')
figure;
subplot(2,1,1);plot(omg2*omgn2/(2*pi),abs(H2));grid on;
title('切比雪夫二型滤波器幅频响应特性');axis([0,16000,0,1.1]);
subplot(2,1,2);plot(omg2*omgn2/(2*pi),angle(H2));grid on;
title('切比雪夫二型滤波器相频响应特性');axis([0,16000,-4,4]);
figure;pzmap(b2,a2);axis square;axis equal;grid on;

[n3,omgn3]=ellipord(omgp,omgs,rp,as,'s');
[z3,p3,k3]=ellipap(n,rp,as);
b3=k3*real(poly(z3));
a3=real(poly(p3));
[H3,omg3]=freqs(b3,a3);
pb3=poly2str(b3,'s')
pa3=poly2str(a3,'s')
figure;
subplot(2,1,1);plot(omg3*omgn3/(2*pi),abs(H3));grid on;
title('椭圆型滤波器幅频响应特性');axis([0,16000,0,1.1]);
subplot(2,1,2);plot(omg3*omgn3/(2*pi),angle(H3));grid on;
title('椭圆滤波器相频响应特性');axis([0,16000,-4,4]);
figure;pzmap(b3,a3);axis square;axis equal;grid on;
