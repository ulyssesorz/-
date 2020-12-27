#2
import matplotlib.pyplot as plt
import numpy as np
from scipy import signal

num=[2,3,0];
den=[1,0.4,1];
h=signal.freqz(num, den);
db=20*np.log10(np.abs(np.array(h[1])));                #相对幅频响应值

plt.subplot(2,1,1);
plt.plot(h[0],db);
plt.title('相对幅度频率响应');
plt.subplot(2,1,2);
plt.plot(h[0],np.angle(np.array(h[1])));
plt.title('相位频率响应');

plt.rcParams['font.sans-serif']=['SimHei']              #中文图名
plt.rcParams['axes.unicode_minus']=False
plt.show();
