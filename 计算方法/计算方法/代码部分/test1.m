%实验一的主程序

clear;
syms x2 y2
rand('seed',1852951);
a=1+2*rand(1);
[x,y]=euler_function('function1_generate',0,1,1);
[x1,y1]=enlerpro_function('function1_generate',0,1,1,0.1);
x2=0:0.01:1;
y2=a*x2+a*exp(-x2)+(1-a);
plot(x,y,'--','linewidth',2)
hold on
plot(x1,y1,'-.','linewidth',2)
hold on
plot(x2,y2,'-','linewidth',2)
legend('欧拉','改进的欧拉','精确值')
