%3
fp1=0.2;fp2=0.3;  %ͨ����ֹƵ��(��һ��)
fs1=0.15;fs2=0.35;  %�����ֹƵ��(��һ��)
wp1=fp1*2*pi;wp2=fp2*2*pi;
ws1=fs1*2*pi;ws2=fs2*2*pi;
rp=1;as=20;             %˥��ָ��
Fs=1000;T=1/Fs;
omgp1=(2/T)*tan(wp1/2);omgp2=(2/T)*tan(wp2/2);
omgp=[omgp1,omgp2];
omgs1=(2/T)*tan(ws1/2);omgs2=(2/T)*tan(ws2/2);
omgs=[omgs1,omgs2];
bw=omgp2-omgp1;w0=sqrt(omgp1*omgp2);        %���������Ƶ��
[n,omgn]=cheb2ord(omgp,omgs,rp,as,'s');                           
[z0,p0,k0]=cheb2ap(n,as);       %��һ���˲���ԭ��
ba1=k0*real(poly(z0))       %�˲���ϵ��
aa1=real(poly(p0))
[ba,aa]=lp2bp(ba1,aa1,w0,bw);       %�任Ϊ��ͨ��
[bd,ad]=bilinear(ba,aa,Fs);
[H,omg]=freqz(bd,ad);       %��Ƶ����Ӧ
figure;
subplot(2,1,1);plot(omg/pi,abs(H));grid on;
title('�б�ѩ��2�ʹ�ͨ�˲�����Ƶ��Ӧ����');
subplot(2,1,2);plot(omg/pi,angle(H));grid on;
title('�б�ѩ��2�ʹ�ͨ�˲�����Ƶ��Ӧ����');
figure;pzmap(ba1,aa1);axis square axis equal;grid on;
