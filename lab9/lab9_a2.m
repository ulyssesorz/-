%2
h=[3,-1,2,-3,5,-3,2,-1,3];
M=length(h);
rz=roots(h);
for i=1:M-1
    r(i)=1/rz(i);
end
r'
zplane(h,1)