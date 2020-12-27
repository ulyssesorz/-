%7
xn=[7,6,5,4,3,2];       %一个周期xn序列 
n=0:length(xn)-1;
Nx=length(xn);          
Nw=1000;dw=2*pi/Nw;     %频率分辨率
k=floor((-Nw/2+0.5):(Nw/2+0.5));
K=3;                    %延拓的次数
nx=0:(K*Nx-1);          %周期延拓后的时间分量
x=xn(mod(nx,Nx)+1);     %周期延拓后的时间信号x

figure;
subplot(2,1,1);stem(xn,'.');title('原信号');
subplot(2,1,2);stem(nx,x,'.');title('周期延拓信号');

Xk=x*(exp(-j*dw*nx'*k))/K;  %傅里叶级数变换
figure;
subplot(2,1,1);plot(k*dw,abs(Xk));title('幅度谱');
subplot(2,1,2);plot(k*dw,angle(Xk));title('相位谱');
