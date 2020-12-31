%2
wp1=0.1*pi;wp2=0.9*pi;  %通带截止频率
ws1=0.3*pi;ws2=0.7*pi;  %阻带截止频率
rp=1;as=40;             %衰减指标
Fs=2000;T=1/Fs;
omgp1=wp1*Fs;omgp2=wp2*Fs;omgp=[omgp1,omgp2];
omgs1=ws1*Fs;omgs2=ws2*Fs;omgs=[omgs1,omgs2];
bw=omgp2-omgp1;w0=sqrt(omgp1*omgp2);        %带宽和中心频率
[n,omgn]=cheb2ord(omgp,omgs,rp,as,'s');                           
[z0,p0,k0]=cheb2ap(n,as);       %归一化滤波器原型
ba1=k0*real(poly(z0))       %滤波器系数
aa1=real(poly(p0))
[ba,aa]=lp2bs(ba1,aa1,w0,bw);       %变换为带阻型
[bd,ad]=impinvar(ba,aa,Fs);
wb=[0:Fs]*2*pi;
Ha=freqs(ba,aa,wb);
H=freqz(bd,ad,wb/Fs);
plot(wb/(2*pi),abs(Ha)/max(abs(Ha)),'--');hold on;
plot(wb/(2*pi),abs(H)/max(abs(H)),'-k');
legend('模拟滤波器幅频响应','数字滤波器幅频响应');
title('模拟阻带滤波器和数字阻带滤波器的幅频响应');