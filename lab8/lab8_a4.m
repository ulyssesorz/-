%4
wp1=0.35*pi;wp2=0.65*pi;
ws1=0.4*pi;ws2=0.6*pi;
rp=1;as=20;             %˥��ָ��
T=0.1;Fs=1/T;
omgp1=(2/T)*tan(wp1/2);omgp2=(2/T)*tan(wp2/2);
omgp=[omgp1,omgp2];
omgs1=(2/T)*tan(ws1/2);omgs2=(2/T)*tan(ws2/2);
omgs=[omgs1,omgs2];
bw=omgp2-omgp1;w0=sqrt(omgp1*omgp2);        %���������Ƶ��
[n,omgn]=ellipord(omgp,omgs,rp,as,'s');                           
[z0,p0,k0]=ellipap(n,rp,as);       %��һ���˲���ԭ��
ba1=k0*real(poly(z0))       %�˲���ϵ��
aa1=real(poly(p0))
[ba,aa]=lp2bs(ba1,aa1,w0,bw);       %�任Ϊ������
[bd,ad]=bilinear(ba,aa,Fs);
[H,omg]=freqz(bd,ad);       %��Ƶ����Ӧ
figure;
subplot(2,1,1);plot(omg/pi,abs(H));grid on;
title('��Բ�����˲�����Ƶ��Ӧ����');
subplot(2,1,2);plot(omg/pi,angle(H));grid on;
title('��Բ�����˲�����Ƶ��Ӧ����');
figure;pzmap(ba1,aa1);axis square axis equal;grid on;