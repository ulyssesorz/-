nx1=-Nx:2*Nx-1;
x1=xn(mod(nx1,Nx)+1);           %周期延拓序列
ny1=nx1+2;y1=x1;
rn=(nx1>=0)&(nx1<Nx);           %主值窗
rn1=(ny1>=0)&(ny1<Nx);
subplot(4,1,1);stem(nx1,rn.*x1,'.');title('xn主值');
subplot(4,1,2);stem(nx1,x1,'.');title('xn延拓')
subplot(4,1,3);stem(ny1,rn1.*y1,'.');title('yn主值');
subplot(4,1,4);stem(ny1,y1,'.');title('yn延拓')
