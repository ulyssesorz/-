%2
n=1:19;
xn=n.*sin(n);           
y1=(n-3).*sin(n-3);
y2=-n.*sin(-n);
y3=-n.*sin(n);
y4=(3-n).*sin(3-n);
y5=(n/2).*sin(n/2);

figure;
subplot(3,1,1);stem(xn,'.');title('xn');
subplot(3,1,2);stem(y1,'.');title('y1');
subplot(3,1,3);stem(y2,'.');title('y2');
figure;
subplot(3,1,1);stem(y3,'.');title('y3');
subplot(3,1,2);stem(y4,'.');title('y4');
subplot(3,1,3);stem(y5,'.');title('y5');
