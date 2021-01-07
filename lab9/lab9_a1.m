%1
h=[3,-1,2,-3,5,-3,2,-1,3];
M=length(h);n=0:M-1;
[A,w,type,tao]=amplres(h);
figure;
stem(n,h);hold on;plot(w/pi,A);title('h1');

h2=[3,-1,2,-3,-3,2,-1,3];
M2=length(h2);n2=0:M2-1;
[A2,w2,type2,tao2]=amplres(h2);
figure;
stem(n2,h2);hold on;plot(w2/pi,A2);title('h2');

h3=[3,-1,2,-3,0,3,-2,1,-3];
M3=length(h3);n3=0:M3-1;
[A3,w3,type3,tao3]=amplres(h3);
figure;
stem(n3,h3);hold on;plot(w3/pi,A3);title('h3');

h4=[3,-1,2,-3,3,-2,1,-3];
M4=length(h4);n4=0:M4-1;
[A4,w4,type4,tao4]=amplres(h4);
figure;
stem(n4,h4);hold on;plot(w4/pi,A4);title('h4');

function[A,w,type,tao] = amplres(h)
% ����FIR�˲���ϵ��,���˲�����������
% h��FIR�˲�����������Ӧ�����ϵ������
% A���˲����ķ�������
% w��Ƶ������,��0��pi֮��ֳ�500��,501����
% type��������λ�˲���������
% tao���������Ե�Ⱥʱ��
N = length(h);tao = (N-1)/2;
L = floor((N-1)/2); % ���˲����Ľ״μ��������ԵĽ״�
n = 1:L+1;
w = [0:500]*2*pi/500; % ȡ�˲���Ƶ������
if all(abs(h(n)-h(N-n+1))<1e-10)   % �ж��˲���ϵ��,��Ϊ�Գ�
A = 2*h(n)*cos(((N+1)/2-n)'*w)-mod(N,2)*h(L+1);
% �Գ������¼���A(��������)
% ��N������ʱ,h(L+1)����һ��,Ҫ������NΪż��ʱ,
% ����mod(N,2)��ȡ������
type = 2-mod(N,2);     % �жϲ���������
elseif all(abs(h(n)+h(N-n+1))<1e-10)&(h(L+1)*mod(N,2)==0) % ϵ����Ϊ���Գ�
% ��N������ʱ,h(L+1)Ϊ������Գ��б�����֮һ,
% NΪż��ʱ,����mod(N,2)��ȡ������
A = 2*h(n)*sin(((N+1)/2-n)'*w); % ���Գ������¼���A(��������)
type = 4-mod(N,2); % �жϲ���������
else error('�����ⲻ��������λ�˲���!') % �˲���ϵ���ǶԳ�,�������
end
