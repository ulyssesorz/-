%4
z=[1,-3,5]';
p=[2,4,-6]';
k=3;

[num,den]=zp2tf(z,p,k)
[sos,g]=zp2sos(z,p,k)
[r,p2,k2]=residuez(num,den)
