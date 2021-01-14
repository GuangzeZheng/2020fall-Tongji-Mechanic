%生成实验二中的y函数表达式

function f=function2_generate(x,y)
rand('seed',1852951)
a=randi(5,1,1);
f=-a*y+a*x*x+a*x;
