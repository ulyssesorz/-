%2
a1=[1,8,19,12];                 %列出系数
b1=[10,20,0,0];
[r1 p1 c1]=residuez(b1,a1)      %展开成分式

a2=[1,1,-0.6];
b2=[0,0,5];
[r2 p2 c2]=residuez(b2,a2)

n=0:9;
h1=r1(1)*p1(1).^n+r1(2)*p1(2).^n+r1(3)*p1(3).^n;        
figure
subplot(2,1,1);stem(n,h1,'.');title('部分分式法求反变换h(n)-第一问');
h2=impz(b1,a1,10);
subplot(2,1,2);stem(n,h2,'.');title('impz求反变换h(n)-第一问');

h3=r2(1)*p2(1).^n+r2(2)*p2(2).^n+c(1).*[n==0];
figure;
subplot(2,1,1);stem(n,h3,'.');title('部分分式法求反变换h(n)-第二问');
h4=impz(b2,a2,10);
subplot(2,1,2);stem(n,h4,'.');title('impz求反变换h(n)-第二问');
