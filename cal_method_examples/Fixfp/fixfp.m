function [k,p,err,P]=fixfp(g,p0,tol,maxl)
%output--------------
%k   --iteration time
%p   --final fixed point
%err  --error
%P    --list of fixed point during iteration
P(1)=p0;
for k=2:maxl
    P(k)=feval(g,P(k-1));
    err=abs(P(k)-P(k-1));
    relerr=err/(abs(P(k))+eps);
    p=P(k);
    if (err<tol) | (relerr<tol)
        disp('(err<tol) or (relerr<tol),stop iteration!')
        break;
    end
end
if k==maxl
    disp('max number of iterations exceeded!')
end
P=P';
    
