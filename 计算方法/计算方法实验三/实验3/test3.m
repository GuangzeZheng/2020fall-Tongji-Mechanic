clear;
rand('seed',1851960);

%% settings
syms x;
a = 1+2*rand(1);
b = 0.8+1.5*rand(1);
f(x) = a*x^b-exp(x)+1;            % generate zero point 
f_diff(x) = a*b*x^(b-1)-exp(x);

error = 0.001;
x0 = 1;
max_iter = 1000;

%% main function
[iter_c,y] = newton(x0,f,f_diff,max_iter,error);