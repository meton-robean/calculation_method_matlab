I_cur=0.602337357879;
e=0;
a=0;
b=1;
for type=1:5
    fprintf('type =%d\n',type);
    I = NewtonCotes('f',a,b,type)
    e=abs(I-I_cur)
end
