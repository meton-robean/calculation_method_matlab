function I = NewtonCotes(f,a,b,type)
%type = 1  梯形公式
%type = 2  辛普森公式
%type = 3  辛普森3/8公式
%type = 4  布尔公式
%type = 5  6点公式
I=0;
switch type
    case 1,
    I=((b-a)/2)*(feval(f,a)+feval(f,b));
    case 2,
    I=((b-a)/6)*(feval(f,a)+4*feval(f,(a+b)/2)+feval(f,b)); 
    case 3,
    I=((b-a)/8)*(feval(f,a)+3*feval(f,(2*a+b)/3)+3*feval(f,(a+2*b)/3)+feval(f,b));
    case 4,
    I=((b-a)/90)*(7*feval(f,a)+32*feval(f,(b+3*a)/4)+12*feval(f,(2*a+2*b)/4)+32*feval(f,(3*b+a)/4)+7*feval(f,b));
    case 5,
    I=((b-a)/840)*(41*feval(f,a)+216*feval(f,(a+(b-a)/5))+27*feval(f,(a+2/5*(b-a)))+272*feval(f,(a+3/5*(b-a)))+27*feval(f,(a+4/5*(b-a)))+216*feval(f,b));
end

end