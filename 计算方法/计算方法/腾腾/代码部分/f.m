
function f=f(x,y)
rand('seed',1851960)
a=randi(5,1,1);
f=-a*y+a*x*x+a*x;
