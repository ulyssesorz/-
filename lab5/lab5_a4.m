%4
xn=[0,1,2,3,2,1,0];
N=length(xn);
xn=[xn,xn];                     %��������
n=0:2*N-1;
k=0:2*N-1;
Xk=xn*exp(-j*2*pi/N).^(n'*k);   %����Ҷ�����任
figure;
subplot(2,1,1);stem(k,abs(Xk),'.');title('����Ƶ��')
subplot(2,1,2);stem(k,angle(Xk),'.');title('��λƵ��');

x=(Xk*exp(j*2*pi/N).^(n'*k))/N;         %��任
figure;
subplot(2,1,1);stem(n,xn,'.');title('ԭͼ��');
subplot(2,1,2);stem(n,x,'.');title('��任��ͼ��');
