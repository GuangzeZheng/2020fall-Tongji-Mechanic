%exp2_2 2020/11/7 zgz
rand('seed',1851960);
%init
a = 18*rand(1)+15*rand(1,5);
b = 19*rand(1)+80*rand(1,5);
x = linspace(14,28,100);

fun = inline('n(1)+n(2)*x.^2','n','x');
n0  = [1,1];
n=nlinfit(a,b,fun,n0);
plot(a,b,'*');
hold on
plot(x,n(1)+n(2)*x.^2);
