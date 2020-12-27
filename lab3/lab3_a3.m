%3
n=0:20;
a=[1,-0.5,0,0,0,0,1,-0.5];
b=[1,-1,1,0,0,0,0,0];             %系统函数的系数
x1=[n>=3];                         %输入序列
x2=[n==0]-[n==5];
x3=exp(0.1*n).*[n>=3];
xi=filtic(b,a,0,0);                 %计算初始状态

y1=dlsim(b,a,x1);                   %求系统的响应
y11=filter(b,a,x1,xi);              %求响应
figure;
subplot(2,1,1);stem(n,y1,'.');title('用dlsim求响应-第一问');
subplot(2,1,2);stem(n,y11,'.');title('用filtic和filter求响应-第一问');

y2=dlsim(b,a,x2);                   
y22=filter(b,a,x2,xi);              
figure;
subplot(2,1,1);stem(n,y2,'.');title('用dlsim求响应-第二问');
subplot(2,1,2);stem(n,y22,'.');title('用filtic和filter求响应-第二问');

y3=dlsim(b,a,x3);                   
y33=filter(b,a,x3,xi);             
figure;
subplot(2,1,1);stem(n,y3,'.');title('用dlsim求响应-第三问');
subplot(2,1,2);stem(n,y33,'.');title('用filtic和filter求响应-第三问');
