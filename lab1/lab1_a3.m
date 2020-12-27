%差分序列
x=[1,2,3,4,5,6,7,6,5,4,3,2,1];
yn=[];
for n=1:13
    if n<=2
        yn(n)=x(3-n);        
    else
        yn(n)=x(n)*x(n-2);
    end
end
stem(yn,'.');title('差分序列');
