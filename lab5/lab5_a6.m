%6
xn=[7,6,5,4,3,2];
N=length(xn);
n=0:N-1;
k=0:N-1;
Xk=xn*exp(-j*2*pi/N).^(n'*k);           %����Ҷ�任
figure;
subplot(2,1,1);stem(n,abs(Xk),'.');title('������');
subplot(2,1,2);stem(n,angle(Xk),'.');title('��λ��');

x=(Xk*exp(j*2*pi/N).^(n'*k))/N;       %����Ҷ��任
figure;
subplot(2,1,1);stem(n,xn,'.');title('ԭ�ź�ͼ��');
subplot(2,1,2);stem(n,x,'.');title('��任ͼ��');
