function R=rk42(f,a,b,ya,M)
h=(b-a)/M;
T=a:h:b;
Y(1,:)=ya(:)';
for j=1:M
    k1=h*feval(f,T(j),Y(j,:));
    k2=h*feval(f,T(j)+h/2,Y(j,:)+k1/2);
    k3=h*feval(f,T(j)+h/2,Y(j,:)+k2/2);
    k4=h*feval(f,T(j)+h,Y(j,:)+k3);
    Y(j+1,:)=Y(j,:)+(k1+2*k2+2*k3+k4)/6;
end
R=[T' Y];
