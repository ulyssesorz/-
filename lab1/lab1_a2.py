import matplotlib.pyplot as plt
import math

n=[i for i in range(-20,20)]
xn1=[math.sin(3.14*i/20) for i in n];
xn2=[math.sin(3.14*i/5) for i in n];
plt.subplot(2,1,1)
plt.stem(n,xn1,linefmt='r-',markerfmt='r.',basefmt='b-')
plt.title('xn1')
plt.subplot(2,1,2)
plt.stem(n,xn2,linefmt='r-',markerfmt='r.',basefmt='b-')
plt.title('xn2')
plt.show()
