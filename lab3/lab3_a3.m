%3
n=0:20;
a=[1,-0.5,0,0,0,0,1,-0.5];
b=[1,-1,1,0,0,0,0,0];             %ϵͳ������ϵ��
x1=[n>=3];                         %��������
x2=[n==0]-[n==5];
x3=exp(0.1*n).*[n>=3];
xi=filtic(b,a,0,0);                 %�����ʼ״̬

y1=dlsim(b,a,x1);                   %��ϵͳ����Ӧ
y11=filter(b,a,x1,xi);              %����Ӧ
figure;
subplot(2,1,1);stem(n,y1,'.');title('��dlsim����Ӧ-��һ��');
subplot(2,1,2);stem(n,y11,'.');title('��filtic��filter����Ӧ-��һ��');

y2=dlsim(b,a,x2);                   
y22=filter(b,a,x2,xi);              
figure;
subplot(2,1,1);stem(n,y2,'.');title('��dlsim����Ӧ-�ڶ���');
subplot(2,1,2);stem(n,y22,'.');title('��filtic��filter����Ӧ-�ڶ���');

y3=dlsim(b,a,x3);                   
y33=filter(b,a,x3,xi);             
figure;
subplot(2,1,1);stem(n,y3,'.');title('��dlsim����Ӧ-������');
subplot(2,1,2);stem(n,y33,'.');title('��filtic��filter����Ӧ-������');
