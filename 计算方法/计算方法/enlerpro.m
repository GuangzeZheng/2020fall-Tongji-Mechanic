%改进后的欧拉函数
function [x,y]=enlerpro(fun,x0,xf,y0,h)
n=fix((xf-x0)/h);
y(1)=y0;
x(1)=x0;
x(n)=0;y(n)=0;
for i=1:(n-1)
    x(i+1)=x0+i*h;
    y1=y(i)+h*feval(fun,x(i),y(i));
    y2=y(i)+h*feval(fun,x(i+1),y1);
    y(i+1)=(y1+y2)/2;
end