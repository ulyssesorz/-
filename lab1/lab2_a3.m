%3
a1=[1,-1,1];
b1=[1,-0.5,0];
a2=[1,0,0,0,0,0]
b2=[1,0.5,-0.5,-1,-0.5,1];
N=32;
n=0:N-1;
hn1=impz(b1,a1,n);
gn1=dstep(b1,a1,n);
hn2=impz(b2,a2,n);
gn2=dstep(b2,a2,n);

x1=[n==0];                          %�弤����
x2=[n>=0];                          %��Ծ����
xi1=filtic(b1,a1,0,0);              %��������
hn11=filter(b1,a1,x1,xi1);          %�˲����õ��弤��Ӧ
gn11=filter(b1,a1,x2,xi1);          %�˲����õ���Ծ��Ӧ
xi2=filtic(b2,a2,0,0);
hn22=filter(b2,a2,x1,xi2);
gn22=filter(b2,a2,x2,xi2);
figure;
subplot(4,1,1),stem(hn1,'.');title('�弤��Ӧ-����һ');
subplot(4,1,2);stem(gn1,'.');title('��Ծ��Ӧ-����һ');
subplot(4,1,3);stem(hn2,'.');title('�弤��Ӧ-����һ');
subplot(4,1,4);stem(gn2,'.');title('��Ծ��Ӧ-����һ');

figure;
subplot(4,1,1),stem(hn11,'.');title('�弤��Ӧ-������');
subplot(4,1,2);stem(gn11,'.');title('��Ծ��Ӧ-������');
subplot(4,1,3);stem(hn22,'.');title('�弤��Ӧ-������');
subplot(4,1,4);stem(gn22,'.');title('��Ծ��Ӧ-������');
