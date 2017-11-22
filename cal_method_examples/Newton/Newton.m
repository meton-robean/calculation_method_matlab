function [p0,err,k,y]=Newton(f,df,p0,delta,epsilon,max1)
%input
    %f Ŀ�꺯��������string
    %df Ŀ�꺯���ĵ���
    %p0 ��ʼֵ
    %delta ����p0�����̲���
    %epsilon ���ں���ֵ�����̲���
    %max1 ����������
%output
    %p0 ��������ĸ�
    %err ���Ĵ������ֵ
    %k  ���յ�������
    %y  ������Ӧ����ֵ
for k=1:max1
    p1=p0-feval(f,p0)/feval(df,p0);
    err=abs(p1-p0);
    relerr=2*err/(abs(p1)+delta);
    p0=p1;
    y=feval(f,p0);
    if (err<delta)|(relerr<delta)|(abs(y)<epsilon),break,end
end
    