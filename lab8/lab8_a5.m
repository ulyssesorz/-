%5
wp=0.2*pi;ws=0.3*pi;
rp=1;as=20;             %˥��ָ��
[n,omgn]=cheb2ord(wp,ws,rp,as);                           
[b,a]=cheby2(n,as,omgn)      
[H,omg]=freqz(b,a);       %��Ƶ����Ӧ
dbH=20*log10(abs(H)+eps)/max(abs(H));
figure;
subplot(2,1,1);plot(omg/pi,abs(H));grid on;
title('�б�ѩ��2�͵�ͨ�˲�����Ƶ��Ӧ����');
subplot(2,1,2);plot(omg/pi,angle(H));grid on;
title('�б�ѩ��2�͵�ͨ�˲�����Ƶ��Ӧ����');
figure;plot(omg/pi,dbH);grid on;title('��Է�Ƶ����');
figure;pzmap(ba1,aa1);axis square axis equal;grid on;