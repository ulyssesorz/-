%2
n=0:20;
a=[1,-0.7,0];
b=[2,0,-1];             %ϵͳ������ϵ��
x=[n>=3];               %��������
y=dlsim(b,a,x);         %��ϵͳ����Ӧ
subplot(2,1,1);stem(n,y,'.');title('��dlsim����Ӧ');

xi=filtic(b,a,0,0);             %�����ʼ״̬
y2=filter(b,a,x,xi);            %����Ӧ
subplot(2,1,2);stem(n,y2,'.');title('��filtic��filter����Ӧ');
