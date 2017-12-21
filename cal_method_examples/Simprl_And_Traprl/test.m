a=0;
b=2;
I_cur=4.006994;
M=20;
e=0;

fprintf('traprl:\n')
s=traprl('f',a,b,M)
e=abs(s-I_cur)


fprintf('simprl:\n')
s=simprl('f',a,b,M)
e=abs(s-I_cur)


