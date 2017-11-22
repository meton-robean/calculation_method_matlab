function [P,iter,err]=newdim(F,JF,P,delta,epsilon,max1)
%input
    %F  ����ⷽ����
    %JF �ſ˱Ⱦ���
    %P  ���⣨��������
%output
    %P  ��������
    %iter  ���յ�����
    %err   ������
    
Y=feval(F,P);  %������
for k=1:max1
    J=feval(JF,P); %�ſ˱Ⱦ���
    Q=P-(J\Y')';   %������ , �����������󣬾������ 
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

