%3
num=[2,3,0];
den=[1,0.4,1];

[z,p,k]=tf2zp(num,den)
[sos,g]=tf2sos(num,den)
[r,p2,k2]=residuez(num,den)
[A,B,C,D]=tf2ss(num,den)
