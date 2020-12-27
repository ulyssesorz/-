%2
x1=[5,4,-3,-2];
x2=[1,2,3,0];
N=length(x1);
n=0:N-1;k=0:N-1;
Xk1=x1*(exp(-j*2*pi/N)).^(n'*k);            %Çódft
Xk2=x2*(exp(-j*2*pi/N)).^(n'*k);
Yk=Xk1.*Xk2;                                %ÆµÓòÏà³Ë
yn=Yk*(exp(j*2*pi/N)).^(n'*k)/N;            %Äæ±ä»»
yn=abs(yn);
subplot(3,1,1);stem(n,yn,'.');title('yn');
subplot(3,1,2);stem(n,x1,'.');title('x1');
subplot(3,1,3);stem(n,x2,'.');title('x2');
