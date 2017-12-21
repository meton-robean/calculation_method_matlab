a=0;
b=3;
ya=1;
h1=0.1; h2=0.05;
M1=30/h1; M2=30/h2;
E=euler('f',a,b,ya,M1);
plot(E(:,1),E(:,2),'r');

hold on;
E=euler('f',a,b,ya,M2);
plot(E(:,1),E(:,2),'g');

hold on;
k=inline('-exp(-t)+t^2-2*t+2');
fplot(k,[0,3]);