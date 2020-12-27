%正弦序列
n=-20:20;
xn1=sin(pi*n/20);          
xn2=sin(pi*n/5);
subplot(2,1,1);stem(n,xn1,'.');
title('正弦序列，周期拓展两倍');
subplot(2,1,2);stem(n,xn2,'.');
title('正弦序列，周期压缩一半');
