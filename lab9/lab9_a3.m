%3
wp=0.2*pi;ws=0.3*pi;
deltaw=ws-wp;           %过渡带宽度
N0=ceil(6.2*pi/deltaw); %滤波器长度
N=N0+mod(N0+1,2);       
windows=(hanning(N))';  %根据阻带截止频率选择汉宁窗
wc=(ws+wp)/2;
hd=ideal_lp(wc,N);      %建立理想低通滤波器
b=hd.*windows;          %FIR滤波器系统函数
[db,mag,pha,grd,w]=freqz_m(b,1);    %频率特性
n=0:N-1;
figure;stem(n,hd,'.');title('脉冲响应');
figure;stem(n,windows,'.');title('窗函数');
figure;
subplot(2,1,1);plot(w/pi,db);title('幅频响应');
subplot(2,1,2);plot(w/pi,pha);title('相频响应');

function hd = ideal_lp(wc,N)
% hd = 点0到N-1之间的理想脉冲响应
% wc = 截止频率(弧度)
% N = 理想滤波器的长度
tao = (N-1)/2;
n = [0:(N-1)];
m = n-tao+eps;  % 加一个小数以避免0作除数
hd = sin(wc*m)./(pi*m);
