%2
a1=[1,8,19,12];                 %�г�ϵ��
b1=[10,20,0,0];
[r1 p1 c1]=residuez(b1,a1)      %չ���ɷ�ʽ

a2=[1,1,-0.6];
b2=[0,0,5];
[r2 p2 c2]=residuez(b2,a2)

n=0:9;
h1=r1(1)*p1(1).^n+r1(2)*p1(2).^n+r1(3)*p1(3).^n;        
figure
subplot(2,1,1);stem(n,h1,'.');title('���ַ�ʽ���󷴱任h(n)-��һ��');
h2=impz(b1,a1,10);
subplot(2,1,2);stem(n,h2,'.');title('impz�󷴱任h(n)-��һ��');

h3=r2(1)*p2(1).^n+r2(2)*p2(2).^n+c(1).*[n==0];
figure;
subplot(2,1,1);stem(n,h3,'.');title('���ַ�ʽ���󷴱任h(n)-�ڶ���');
h4=impz(b2,a2,10);
subplot(2,1,2);stem(n,h4,'.');title('impz�󷴱任h(n)-�ڶ���');
