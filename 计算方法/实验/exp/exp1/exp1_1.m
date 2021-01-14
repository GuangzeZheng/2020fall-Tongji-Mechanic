%exp1 2020/11/7 zgz
rand('seed',1851960);
%points
% [a1,a2,a3,a4] = 1+5*rand(1,4);
% [b1,b2,b3,b4] = 1+5*rand(1,4);
a = 1+5*rand(1,4);
b = 1+5*rand(1,4);

%construct coordinates
x = linspace(0,6,60);
y = lagrange(a,b,x);

%draw
plot(x,y);
ylabel('Ln(x)');
title('Lagrange interpolation');
hold on 

%draw additional points
x0 = 2 + 3*rand(1,2);
y0 = lagrange(a,b,x0);
for i = 1:2
    plot(x0(1,i),y0(1,i),'.','MarkerSize',14);
end



