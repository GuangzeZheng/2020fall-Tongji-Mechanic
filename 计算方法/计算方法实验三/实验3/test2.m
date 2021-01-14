clear;
rand('seed',1851960);

%% settings
syms x y;
a      = 0.5 + 1.5*rand(1);
fun(x) = x*x-x-a;
error  = 0.03 + 0.03*rand(1);
iter_c = 1;

%% main function
[iter,y]  = two(0,100,fun,error,iter_c);