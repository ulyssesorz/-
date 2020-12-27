%6
fp1=3.5;op1=2*pi*fp1;
fp2=5.5;op2=2*pi*fp2;omgp=[op1,op2];
fs1=3;os1=2*pi*fs1;
fs2=6;os2=2*pi*fs2;omgs=[os1,os2];
bw=op2-op1;w0=sqrt(op1*op2);
rp=1;as=40;

[n,omgn]=ellipord(omgp,omgs,rp,as,'s');  %低通滤波器原型
[z0,p0,k0]=ellipap(n,rp,as);
b0=k0*real(poly(z0));                   %滤波器系数
a0=real(poly(p0));
[H,omg]=freqs(b0,a0);                   %频率特性
figure;
subplot(2,1,1);plot(omg/2/pi,abs(H)/pi*180);grid on;
title('归一化模拟低通滤波器原型幅频响应特性');axis([0,1,0,60]);
subplot(2,1,2);plot(omg/2/pi,angle(H)/pi*180);grid on;
title('归一化模拟低通滤波器原型相频响应特性');axis([0,1,-200,200]);

[ba,aa]=lp2bp(b0,a0,w0,bw);
[Ha,omga]=freqs(ba,aa);            
figure;
subplot(2,1,1);plot(omga/2/pi,abs(Ha)/pi*180);grid on;
title('实际模拟低通滤波器幅频响应特性');axis([0,2*fs2,0,60]);
subplot(2,1,2);plot(omga/2/pi,angle(Ha)/pi*180);grid on;
title('实际模拟低通滤波器相频响应特性');axis([0,2*fs2,-200,200]);
