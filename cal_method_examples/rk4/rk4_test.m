a=0;
b=1;
ya=1;
h1=0.1; h2=0.05;
M1=30/h1; M2=30/h2;
E1=rk4('f',a,b,ya,M1);
plot(E1(:,1),E1(:,2),'r');

hold on;
E2=rk4('f',a,b,ya,M2);
plot(E2(:,1),E2(:,2),'g');

hold on;
k=inline('(4*exp(3*t)-3*t-1)/3');
fplot(k,[0,1]);