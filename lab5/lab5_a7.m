%7
xn=[7,6,5,4,3,2];       %һ������xn���� 
n=0:length(xn)-1;
Nx=length(xn);          
Nw=1000;dw=2*pi/Nw;     %Ƶ�ʷֱ���
k=floor((-Nw/2+0.5):(Nw/2+0.5));
K=3;                    %���صĴ���
nx=0:(K*Nx-1);          %�������غ��ʱ�����
x=xn(mod(nx,Nx)+1);     %�������غ��ʱ���ź�x

figure;
subplot(2,1,1);stem(xn,'.');title('ԭ�ź�');
subplot(2,1,2);stem(nx,x,'.');title('���������ź�');

Xk=x*(exp(-j*dw*nx'*k))/K;  %����Ҷ�����任
figure;
subplot(2,1,1);plot(k*dw,abs(Xk));title('������');
subplot(2,1,2);plot(k*dw,angle(Xk));title('��λ��');
