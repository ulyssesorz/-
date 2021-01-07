%5
N=41;T1=0.38;n=0:N-1;
wp1=0.4*pi;wp2=0.6*pi;
ws1=0.25*pi;ws2=0.75*pi;
N1=round((wp2-wp1)/(2*pi/N));   %ͨ����������
N1=N1+mod(N1+1,2);
N2=round((N-2*N1-9)/4);
N2=N2+mod(N2+1,2);
N3=N-2*N2-2*N1-4;
A=[zeros(1,N2),T1,ones(1,N1),T1,zeros(1,N3),T1,ones(1,N1),T1,zeros(1,N2)];%��������
theta=-pi*(N-1)/N*[0:N-1];  %��λ��������
Hk=A.*exp(j*theta);         %Ƶ����������
h=real(ifft(Hk));
[db,mag,pha,grd,w]=freqz_m(h,1);    %Ƶ������
m=(N-1)/2;wa=[0:m-1]/m;
figure;
plot(wa,A(1:m),'.-',w/pi,mag);title('�����Ƶ���������м�ʵ�ʷ�Ƶ��Ӧ')
figure;stem(n,h,'.');title('�˲���������Ӧ');
figure;
subplot(2,1,1);plot(w/pi,db);title('��Ƶ��Ӧ');
subplot(2,1,2);plot(w/pi,pha);title('��Ƶ��Ӧ');


wpp1=0.4;wpp2=0.6;
wss1=0.25;wss2=0.75;
wc1=(wss1+wpp1)/2;wc2=(wss2+wpp2)/2;
f=[0,wss1,wc1,wpp1,wpp2,wc2,wss2,1];
m2=[0,0,T1,1,1,T1,0,0];
windows=blackman(N).';
b=fir2(N-1,f,m2,windows);
[db2,mag2,pha2,grd2,w2]=freqz_m(b,1);    %Ƶ������
figure;
plot(f,m2,'.-',w2/pi,mag2);title('�����Ƶ���������м�ʵ�ʷ�Ƶ��Ӧ')
figure;stem(n,b,'.');title('�˲���������Ӧ');
figure;
subplot(2,1,1);plot(w2/pi,db2);title('��Ƶ��Ӧ');
subplot(2,1,2);plot(w2/pi,pha2);title('��Ƶ��Ӧ');