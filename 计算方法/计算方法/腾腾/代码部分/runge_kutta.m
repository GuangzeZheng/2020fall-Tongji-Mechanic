%龙格库塔法的实现程序

function y=runge_kutta(f,x,y,h)
k1=f(x,y);
k2=f(x+0.5*h,y+0.5*h*k1);
k3=f(x+0.5*h,y+0.5*h*k2);
k4=f(x+h,y+h*k3);
y=y+(1/6)*(k1+k2*2+2*k3+k4)*h;
