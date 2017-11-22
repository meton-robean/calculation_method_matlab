% π”√fplot
%y=inline('exp(x)-x^2+3*x-2');
y=inline('0.5+0.25*x^2-x*sin(x)-0.5*cos(2*x);');
fplot(y,[-2.2,2.2])
grid