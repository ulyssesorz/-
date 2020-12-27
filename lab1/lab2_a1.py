import matplotlib.pyplot as plt
import math
import numpy

n=[i for i in range(-4,5)];
n2=[i for i in range(1,24)];
k1=-3;k2=4;k3=2;k4=-2;
t1=[k1 == i for i in n];       #产生冲激序列
t2=[k2 == i for i in n];
u1=[k3<=i for i in n];         #产生阶跃序列
u2=[k4<=i for i in n];

t1=numpy.array(t1) + 0;       #将真值形式转为二进制形式
t2=numpy.array(t2) + 0;
tn=t1 + 2 * t2;

u1=numpy.array(u1)+0;
u2=numpy.array(u2)+0;
un=u1+u2;

x1=[math.exp(i/-16) for i in n2];
x2=[5*math.sin(2*3.14*i/10) for i in n2];
xn=numpy.array(x1)*numpy.array(x2);         #列表对应相乘


plt.subplot(3,1,1);plt.stem(tn);            #作图
plt.title('tn');
plt.subplot(3,1,2);plt.stem(un);
plt.title('un')
plt.subplot(3,1,3);plt.stem(xn);
plt.title('xn');
plt.show();
