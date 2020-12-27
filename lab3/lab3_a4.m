%4
n=0:20;
a=[1,-0.602012,0.495684,-0.035924];
b=[0.187632,0.241242,0.241242,0.187632];             %系统函数的系数
x1=[n==3];                         %输入序列
x2=[n>=0]-[n>=5];
x3=cos(2*pi.*n/3)+sin(3*pi.*n/10);

x0=zeros(1,21);             %零输入信号
y01=[5,5];
xi=filtic(b,a,y01);
y0=filter(b,a,x0,xi);       %零输入响应
xi0=filtic(b,a,0);
y1=filter(b,a,x1,xi0);       %零状态响应
y_1=filter(b,a,x1,xi);       %完全响应
y2=filter(b,a,x2,xi0);       
y_2=filter(b,a,x2,xi);       
y3=filter(b,a,x3,xi0);       
y_3=filter(b,a,x3,xi);       

figure;
stem(n,y0,'.');title('系统的零状态响应');

figure;
subplot(2,1,1);stem(n,y1,'.');title('零输入响应-第一问');
subplot(2,1,2);stem(n,y_1,'.');title('完全响应-第一问');

figure;
subplot(2,1,1);stem(n,y2,'.');title('零输入响应-第二问');
subplot(2,1,2);stem(n,y_2,'.');title('完全响应-第二问');

figure;
subplot(2,1,1);stem(n,y3,'.');title('零输入响应-第三问');
subplot(2,1,2);stem(n,y_3,'.');title('完全响应-第三问');
