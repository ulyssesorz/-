%4
Fs=20000;
fp1=3500;fp2=6500;
fs1=2500;fs2=7500;
wp1=fp1/(Fs/2)*pi;wp2=fp2/(Fs/2)*pi;
ws1=fs1/(Fs/2)*pi;ws2=fs2/(Fs/2)*pi;
deltaw=wp1-ws1;         %过渡带宽度
N0=ceil(11*pi/deltaw); %滤波器长度
N=N0+mod(N0+1,2);       
windows=(blackman(N))';  %根据阻带截止频率选择布莱克曼窗
wc1=(ws1+wp1)/2;wc2=(ws2+wp2)/2;
hd=ideal_lp(wc2,N)-ideal_lp(wc1,N);      %建立理想低通滤波器
b=hd.*windows;          %FIR滤波器系统函数
[db,mag,pha,grd,w]=freqz_m(b,1);    %频率特性
n=0:N-1;
figure;stem(n,hd,'.');title('脉冲响应');
figure;stem(n,windows,'.');title('窗函数');
figure;
subplot(2,1,1);plot(w/pi,db);title('幅频响应');
subplot(2,1,2);plot(w/pi,pha);title('相频响应');

% 计算滤波器的绝对和相对幅度频率响应和相位频率响应
function [db,mag,pha,grd,w] = freqz_m(b,a)
[H,w] = freqz(b,a,1000,'whole');
H = (H(1:501))';w = (w(1:501))';
mag = abs(H);
db = 20*log10((mag+eps)/max(mag));
pha = angle(H);
grd = grpdelay(b,a,w);
