%exp2_4 2020/11/7 zgz
rand('seed',1851960);
%init
a = 2.5*rand(1,1);
b = 3*rand(1,1);

%calculate sum
fun = @(x) x^b;
[s,~,~] = romberg(fun,0,a,1e-5);



