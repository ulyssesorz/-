%2
n=0:20;
a=[1,-0.7,0];
b=[2,0,-1];             %系统函数的系数
x=[n>=3];               %输入序列
y=dlsim(b,a,x);         %求系统的响应
subplot(2,1,1);stem(n,y,'.');title('用dlsim求响应');

xi=filtic(b,a,0,0);             %计算初始状态
y2=filter(b,a,x,xi);            %求响应
subplot(2,1,2);stem(n,y2,'.');title('用filtic和filter求响应');
