%用于建立实验三中的微分方程

function f=equation3_generate(x,y)
v0=30.48;g=9.8;
a=sin(pi/6)*v0;b=cos(pi/6)*v0;
f=a/b-g*x/b^2+0*y;
