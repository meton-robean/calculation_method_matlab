function [P,iter,err]=newdim(F,JF,P,delta,epsilon,max1)
%input
    %F  待求解方程组
    %JF 雅克比矩阵
    %P  初解（行向量）
%output
    %P  最后输出解
    %iter  最终迭代数
    %err   解的误差
    
Y=feval(F,P);  %行向量
for k=1:max1
    J=feval(JF,P); %雅克比矩阵
    Q=P-(J\Y')';   %行向量 , 这里左乘逆矩阵，就是左除 
    Z=feval(F,Q); 
    err=norm(Q-P);
    relerr=err/(norm(Q)+eps);
    P=Q; 
    Y=Z;
    iter=k;
    if(err<delta)|(relerr<delta)|(abs(Y)<epsilon)
        break
    end
end

