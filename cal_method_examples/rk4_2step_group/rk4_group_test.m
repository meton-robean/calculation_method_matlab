a=0;
b=2;
xa=2; ya=1;
y(1)=xa; y(2)=ya;
h1=0.05; 
M=30/h1;
E=rk42('f',a,b,y,M)
plot(E(:,1),E(:,2),'r');

hold on;
k1=inline('4*exp(-t/2)+7*exp(3*t)-9*exp(2*t)');
fplot(k1,[0,2]);


