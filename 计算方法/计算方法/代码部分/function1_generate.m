%生成实验一中的y的一阶导数表达式

function f=function1_generate(x,y)
rand('seed',1852951)
a=1+2*rand(1);
f=-y+a*x+1;
