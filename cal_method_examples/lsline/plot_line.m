X=[-4,-2,0,2,4];
Y=[1.2,2.8,6.2,7.8,13.2];
plot(X,Y,'ro');
hold on
y=inline('1.45*x+6.24');
fplot(y,[-5,5]);
% hold on
% polyfit(X,Y,1)