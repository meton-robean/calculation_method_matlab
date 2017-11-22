x=[-1,0,1,2,3];
y=[6.62,3.94,2.17,1.35,0.89];
plot(x,y,'ro');
grid
hold on

%[A,B] = ls_algebraic_fraction_curve(x,y)

f=inline('1/(0.2432*x+0.3028)');
fplot(f,[-1,5]);
