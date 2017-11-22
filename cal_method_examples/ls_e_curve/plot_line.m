x=[-1,0,1,2];
y=[13.45,3.01,0.67,0.15];
plot(x,y,'ro');
grid
hold on

[A,C]=ls_e_curve(x,y)

f=inline('3.0053*exp(-1.4991*x)');
fplot(f,[-2,3]);
