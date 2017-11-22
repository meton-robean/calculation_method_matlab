function [A,C]=ls_e_curve(x,y)
X=x;
Y=log(y);
[A,B]=lsline(X,Y);
C=exp(B);

