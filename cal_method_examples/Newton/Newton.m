function [p0,err,k,y]=Newton(f,df,p0,delta,epsilon,max1)
%input
    %f 目标函数的名字string
    %df 目标函数的导数
    %p0 初始值
    %delta 对于p0的容忍参数
    %epsilon 对于函数值的容忍参数
    %max1 最大迭代次数
%output
    %p0 最终输出的根
    %err 根的错误估计值
    %k  最终迭代次数
    %y  根所对应函数值
for k=1:max1
    p1=p0-feval(f,p0)/feval(df,p0);
    err=abs(p1-p0);
    relerr=2*err/(abs(p1)+delta);
    p0=p1;
    y=feval(f,p0);
    if (err<delta)|(relerr<delta)|(abs(y)<epsilon),break,end
end
    