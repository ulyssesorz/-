%3
wp=0.2*pi;ws=0.3*pi;
deltaw=ws-wp;           %���ɴ����
N0=ceil(6.2*pi/deltaw); %�˲�������
N=N0+mod(N0+1,2);       
windows=(hanning(N))';  %���������ֹƵ��ѡ������
wc=(ws+wp)/2;
hd=ideal_lp(wc,N);      %���������ͨ�˲���
b=hd.*windows;          %FIR�˲���ϵͳ����
[db,mag,pha,grd,w]=freqz_m(b,1);    %Ƶ������
n=0:N-1;
figure;stem(n,hd,'.');title('������Ӧ');
figure;stem(n,windows,'.');title('������');
figure;
subplot(2,1,1);plot(w/pi,db);title('��Ƶ��Ӧ');
subplot(2,1,2);plot(w/pi,pha);title('��Ƶ��Ӧ');

function hd = ideal_lp(wc,N)
% hd = ��0��N-1֮�������������Ӧ
% wc = ��ֹƵ��(����)
% N = �����˲����ĳ���
tao = (N-1)/2;
n = [0:(N-1)];
m = n-tao+eps;  % ��һ��С���Ա���0������
hd = sin(wc*m)./(pi*m);
