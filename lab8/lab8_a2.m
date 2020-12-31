%2
wp1=0.1*pi;wp2=0.9*pi;  %ͨ����ֹƵ��
ws1=0.3*pi;ws2=0.7*pi;  %�����ֹƵ��
rp=1;as=40;             %˥��ָ��
Fs=2000;T=1/Fs;
omgp1=wp1*Fs;omgp2=wp2*Fs;omgp=[omgp1,omgp2];
omgs1=ws1*Fs;omgs2=ws2*Fs;omgs=[omgs1,omgs2];
bw=omgp2-omgp1;w0=sqrt(omgp1*omgp2);        %���������Ƶ��
[n,omgn]=cheb2ord(omgp,omgs,rp,as,'s');                           
[z0,p0,k0]=cheb2ap(n,as);       %��һ���˲���ԭ��
ba1=k0*real(poly(z0))       %�˲���ϵ��
aa1=real(poly(p0))
[ba,aa]=lp2bs(ba1,aa1,w0,bw);       %�任Ϊ������
[bd,ad]=impinvar(ba,aa,Fs);
wb=[0:Fs]*2*pi;
Ha=freqs(ba,aa,wb);
H=freqz(bd,ad,wb/Fs);
plot(wb/(2*pi),abs(Ha)/max(abs(Ha)),'--');hold on;
plot(wb/(2*pi),abs(H)/max(abs(H)),'-k');
legend('ģ���˲�����Ƶ��Ӧ','�����˲�����Ƶ��Ӧ');
title('ģ������˲�������������˲����ķ�Ƶ��Ӧ');