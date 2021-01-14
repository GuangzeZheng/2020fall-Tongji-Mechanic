%Å·À­º¯Êý
function [tout,yout]=euler(ypfun,t0,tfinal,y0,tol,trace)
pow=1/3;
if nargin<5,tol=1.e-3;end
if nargin<5,trace=0;end
t=t0;
hmax=(tfinal-t)/16;
h=hmax/8;
y=y0(:);
chunk=128;
tout=zeros(chunk,1);
yout=zeros(chunk,length(y));
k=1;
tout(k)=t;
yout(k,:)=y.';
if trace
    clc,t,h,y
end
while (t<tfinal)&(h+t>t)
    if t+h>tfinal,h=tfinal-t;end
    f=feval(ypfun,t,y);f=f(:);
    delta=norm(h*f,'inf');
    tau=tol*max(norm(y,'inf'),1.0);
    if delta<=tau
        t=t+h;
        y=y+h*f;
        k=k+1;
        if k>length(tout)
            tout=[tout;zeros(chunk,1)];
            yout=[yout;zeros(chunk,length(y))];
                end
                tout(k)=t;
                yout(k,:)=y.';
                end
                if trace
                home,t,h,y
                end
                if delta~=0.0
                    h=min(hmax,0.9*h*(tau/delta)^pow);
                end
end
if(t<tfinal)
    disp('singularity likely')
    t
end
tout=tout(1:k);
yout=yout(1:k,:);

