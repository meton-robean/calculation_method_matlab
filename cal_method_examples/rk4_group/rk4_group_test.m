a=0;
b=2;
xa=0.2; ya=0.5;
y(1)=xa; y(2)=ya;
h1=0.1; 
M=30/h1;
E=rk42('f',a,b,y,M)
plot(E(:,1),E(:,2),'r');

hold on;
plot(E(:,1),E(:,3),'g');

hold on;
k1=inline('(2*exp(t)-t*exp(t))/10');
fplot(k1,[0,2],'y');

hold on;
k2=inline('(5*exp(t)-2*t*exp(t))/10');
fplot(k2,[0,2],'b');

