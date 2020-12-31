%1
wp1=0.3*pi;wp2=0.7*pi;  %ͨ����ֹƵ��
ws1=0.1*pi;ws2=0.9*pi;  %�����ֹƵ��
rp=1;as=15;             %˥��ָ��
fs=2000;T=1/fs;
omgp1=wp1*fs;omgp2=wp2*fs;omgp=[omgp1,omgp2];
omgs1=ws1*fs;omgs2=ws2*fs;omgs=[omgs1,omgs2];
bw=omgp2-omgp1;w0=sqrt(omgp1*omgp2);        %���������Ƶ��
[n,omgn]=buttord(omgp,omgs,rp,as,'s');                           
[z0,p0,k0]=buttap(n);       %��һ���˲���ԭ��
ba1=k0*real(poly(z0))       %�˲���ϵ��
aa1=real(poly(p0))
[ba,aa]=lp2bp(ba1,aa1,w0,bw);       %�任Ϊ��ͨ��
[bd,ad]=impinvar(ba,aa,fs);
[H,omg]=freqz(bd,ad);       %��Ƶ����Ӧ
figure;
subplot(2,1,1);plot(omg/pi,abs(H));grid on;
title('������˹��ͨ�˲�����Ƶ��Ӧ����');
subplot(2,1,2);plot(omg/pi,angle(H));grid on;
title('������˹��ͨ�˲�����Ƶ��Ӧ����');
figure;pzmap(ba1,aa1);axis square axis equal;grid on;
