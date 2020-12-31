%5
wp=0.2*pi;ws=0.3*pi;
rp=1;as=20;             %衰减指标
[n,omgn]=cheb2ord(wp,ws,rp,as);                           
[b,a]=cheby2(n,as,omgn)      
[H,omg]=freqz(b,a);       %求频率响应
dbH=20*log10(abs(H)+eps)/max(abs(H));
figure;
subplot(2,1,1);plot(omg/pi,abs(H));grid on;
title('切比雪夫2型低通滤波器幅频响应特性');
subplot(2,1,2);plot(omg/pi,angle(H));grid on;
title('切比雪夫2型低通滤波器相频响应特性');
figure;plot(omg/pi,dbH);grid on;title('相对幅频特性');
figure;pzmap(ba1,aa1);axis square axis equal;grid on;