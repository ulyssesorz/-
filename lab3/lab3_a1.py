#1
import matplotlib.pyplot as plt
import math
import numpy as np

n1=[i for i in range(0,10)];
n2=[i for i in range(-3,13)];

f1n=[i==1 for i in n1];                                 #生成序列
f2n=[i>=2 for i in n1];
y1n=np.convolve(f1n,f2n);                               #卷积函数
y1n=np.array(y1n)+0;                                    #转化为0，1形式
plt.subplot(3,1,1);plt.stem(y1n);plt.title('第一问');

f3n=[i>=0 for i in n1];
f4n=[math.exp(0.2*i) for i in n1];
y2n=np.convolve(f3n,f4n);
y2n=np.array(y2n)+0;
plt.subplot(3,1,2);plt.stem(y2n);plt.title('第二问');

xn=[math.sin(i/2) for i in n2];
hn=[0.5**i for i in n2];
y3n=np.convolve(xn,hn);
y3n=np.array(y3n)+0;
plt.subplot(3,1,3);plt.stem(y3n);plt.title('第三问');

plt.rcParams['font.sans-serif']=['SimHei']              #中文图名
plt.rcParams['axes.unicode_minus']=False
plt.show();
