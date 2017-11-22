function X= jacobi(A,B,P,delta,maxl )
%求解方程组：AX=B
% input :
    % A: 方程左端系数矩阵(N*N)
    %B:  方程右端系数向量(N*1)
    %P:  初始解向量(N*1)
    %delta：P的容忍率
    %maxl：最大迭代数
N=length(B);
for k=1:maxl
        for j=1:N
           % X(j)=( B(j)- A(j,[1:j-1,j+1:N])*P([1:j-1,j+1:N]) )/A(j,j) ;
           X(j)=(B(j)-A(j,[1:j-1,j+1:N])*P([1:j-1,j+1:N]))/A(j,j);
        end
        err=abs(norm(X'-P));
        relerr=err/(eps+norm(X));
        P= X';
        if (err<delta) | (relerr<delta)
               break
        end
 end
X=X';
end
