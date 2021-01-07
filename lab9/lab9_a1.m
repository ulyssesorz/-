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
% 给定FIR滤波器系数,求滤波器符幅特性
% h＝FIR滤波器的脉冲响应或分子系数向量
% A＝滤波器的符幅特性
% w＝频率向量,在0到pi之间分成500份,501个点
% type＝线性相位滤波器的类型
% tao＝符幅特性的群时延
N = length(h);tao = (N-1)/2;
L = floor((N-1)/2); % 求滤波器的阶次及符幅特性的阶次
n = 1:L+1;
w = [0:500]*2*pi/500; % 取滤波器频率向量
if all(abs(h(n)-h(N-n+1))<1e-10)   % 判断滤波器系数,若为对称
A = 2*h(n)*cos(((N+1)/2-n)'*w)-mod(N,2)*h(L+1);
% 对称条件下计算A(两种类型)
% 在N＝奇数时,h(L+1)多算一倍,要减掉。N为偶数时,
% 乘以mod(N,2)以取消这项
type = 2-mod(N,2);     % 判断并给出类型
elseif all(abs(h(n)+h(N-n+1))<1e-10)&(h(L+1)*mod(N,2)==0) % 系数若为反对称
% 在N＝奇数时,h(L+1)为零是奇对称判别条件之一,
% N为偶数时,乘以mod(N,2)以取消这项
A = 2*h(n)*sin(((N+1)/2-n)'*w); % 反对称条件下计算A(两种类型)
type = 4-mod(N,2); % 判断并给出类型
else error('错误：这不是线性相位滤波器!') % 滤波器系数非对称,报告错误
end
