%1
syms a n w0
x1=n*a^n;
x2=sin(w0*n);
x3=2^n;
x4=exp(-a*n)*sin(n*w0);

X1=ztrans(x1)
X2=ztrans(x2)
X3=ztrans(x3)
X4=ztrans(x4)
