%3
k=1;
z=[0,-2]';
p=[0.3,0.4,0.6]';               %�г��㼫��
[b,a]=zp2tf(z,p,k);             %ת��Ϊϵͳ���ݺ���ģ��
[h,w]=freqz(b,a);
db=20*log10(abs(h));            %��Է�Ƶ��Ӧֵ
figure;
subplot(3,1,1);plot(abs(h));title('���Է���Ƶ����Ӧ');
subplot(3,1,2);plot(db);title('��Է���Ƶ����Ӧ');
subplot(3,1,3);plot(angle(h));title('��λƵ����Ӧ');
figure;
zplane(z,p);
