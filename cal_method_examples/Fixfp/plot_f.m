%x=0:0.1:pi;
%y=cos(x);
%z=cos(x).^2;
%plot(x,y,'o')

% π”√fplot
y=inline('2*x-tan(x)');
fplot(y,[-1.4,1.4])
grid