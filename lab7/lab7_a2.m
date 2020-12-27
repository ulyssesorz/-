%2
b=[1,0.885,0.212,0.212,0.885];
a=[1];
[sos,g]=tf2sos(b,a)
K=tf2latc(b,a)
