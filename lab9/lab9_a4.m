%4
Fs=20000;
fp1=3500;fp2=6500;
fs1=2500;fs2=7500;
wp1=fp1/(Fs/2)*pi;wp2=fp2/(Fs/2)*pi;
ws1=fs1/(Fs/2)*pi;ws2=fs2/(Fs/2)*pi;
deltaw=wp1-ws1;         %���ɴ����
N0=ceil(11*pi/deltaw); %�˲�������
N=N0+mod(N0+1,2);       
windows=(blackman(N))';  %���������ֹƵ��ѡ����������
wc1=(ws1+wp1)/2;wc2=(ws2+wp2)/2;
hd=ideal_lp(wc2,N)-ideal_lp(wc1,N);      %���������ͨ�˲���
b=hd.*windows;          %FIR�˲���ϵͳ����
[db,mag,pha,grd,w]=freqz_m(b,1);    %Ƶ������
n=0:N-1;
figure;stem(n,hd,'.');title('������Ӧ');
figure;stem(n,windows,'.');title('������');
figure;
subplot(2,1,1);plot(w/pi,db);title('��Ƶ��Ӧ');
subplot(2,1,2);plot(w/pi,pha);title('��Ƶ��Ӧ');

% �����˲����ľ��Ժ���Է���Ƶ����Ӧ����λƵ����Ӧ
function [db,mag,pha,grd,w] = freqz_m(b,a)
[H,w] = freqz(b,a,1000,'whole');
H = (H(1:501))';w = (w(1:501))';
mag = abs(H);
db = 20*log10((mag+eps)/max(mag));
pha = angle(H);
grd = grpdelay(b,a,w);
