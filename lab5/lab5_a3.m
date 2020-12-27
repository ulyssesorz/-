%3
k=1;
z=[0,-2]';
p=[0.3,0.4,0.6]';               %列出零极点
[b,a]=zp2tf(z,p,k);             %转化为系统传递函数模型
[h,w]=freqz(b,a);
db=20*log10(abs(h));            %相对幅频响应值
figure;
subplot(3,1,1);plot(abs(h));title('绝对幅度频率响应');
subplot(3,1,2);plot(db);title('相对幅度频率响应');
subplot(3,1,3);plot(angle(h));title('相位频率响应');
figure;
zplane(z,p);
