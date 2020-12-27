import matplotlib.pyplot as plt

n=[i for i in range(0,20)]
a1=0.5
a2=2
xn1=[pow(a1,i/2) for i in n]
xn2=[pow(a2,i/2) for i in n]
plt.subplot(2,1,1)
plt.stem(n,xn1,linefmt='r-',markerfmt='r.',basefmt='b-')
plt.title('xn1')
plt.subplot(2,1,2)
plt.stem(n,xn2,linefmt='r-',markerfmt='r.',basefmt='b-')
plt.title('xn2')
plt.show()
