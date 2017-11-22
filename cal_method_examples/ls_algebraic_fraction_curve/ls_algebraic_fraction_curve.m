function [ A,B] = ls_algebraic_fraction_curve(x,y)
Y=1 ./y;
X=x;
[A,B]=lsline(X,Y);

end

