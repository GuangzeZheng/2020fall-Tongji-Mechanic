%实验一函数
syms x2 y2
rand('seed',1853154)
a=1+2*rand(1);
[x,y]=euler('one',0,1,1);
[x1,y1]=eulerpro('one',0,1,1,0.1);
x2=0:0.01:1;
y2=a*x2+a*exp(-x2)+(1-a);
plot(x,y,'-',x1,y1,'--',x2,y2,'-.')
legend('Euler','Euler+','exact')

