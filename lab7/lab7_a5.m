%5
fp=35000;omgp=2*pi*fp;
fs=6000;omgs=2*pi*fs;
rp=1;as=40;

[n,omgn]=cheb2ord(omgp,omgs,rp,as,'s');  %��ͨ�˲���ԭ��
[z0,p0,k0]=cheb2ap(n,as);
b0=k0*real(poly(z0));                   %�˲���ϵ��
a0=real(poly(p0));
[H,omg]=freqs(b0,a0);                   %Ƶ������
figure;
subplot(2,1,1);plot(omg/2/pi,abs(H)/pi*180);grid on;
title('��һ��ģ���ͨ�˲���ԭ�ͷ�Ƶ��Ӧ����');axis([0,1,0,60]);
subplot(2,1,2);plot(omg/2/pi,angle(H)/pi*180);grid on;
title('��һ��ģ���ͨ�˲���ԭ����Ƶ��Ӧ����');axis([0,1,-200,200]);

[ba,aa]=lp2lp(b0,a0,omgn);
[Ha,omga]=freqs(ba,aa);            
figure;
subplot(2,1,1);plot(omga/2/pi,abs(Ha)/pi*180);grid on;
title('ʵ��ģ���ͨ�˲�����Ƶ��Ӧ����');axis([0,2*fs,0,60]);
subplot(2,1,2);plot(omga/2/pi,angle(Ha)/pi*180);grid on;
title('ʵ��ģ���ͨ�˲�����Ƶ��Ӧ����');axis([0,2*fs,-200,200]);
