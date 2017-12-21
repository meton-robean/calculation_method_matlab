function [I,step]=bbctrape(f,a,b,eps)
if(nargin==3)
    eps =1.0e-4;
end;
n=0;
h=(b-a);
I2=(feval(f,a)+feval(f,b))*(h/2);
tol=1;
while tol>eps
    n=n+1;
    h=h/2;
    I1=I2;
    I2=0;
    for i=0:(2^n-1)
        x=a+h*i;
        x1=x+h;
        I2=I2+(h/2)*(feval(f,x)+feval(f,x1));
    end
    tol=abs(I2-I1);
    fprintf('%10.0f,%10.4f\n',n,I2)
    pause(0.1)
end
I=I2;
step=n;