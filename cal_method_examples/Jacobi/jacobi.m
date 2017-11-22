function X= jacobi(A,B,P,delta,maxl )
%��ⷽ���飺AX=B
% input :
    % A: �������ϵ������(N*N)
    %B:  �����Ҷ�ϵ������(N*1)
    %P:  ��ʼ������(N*1)
    %delta��P��������
    %maxl����������
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
