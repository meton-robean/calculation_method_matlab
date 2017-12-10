sys=tf(400,[1,50,0]);
dsys=c2d(sys,ts,'z')
[num,den]=tfdata(dsys,'v')