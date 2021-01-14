%exp2 2020/11/7 zgz
rand('seed',1851960);
%construct coordinates
n  = randi([8,20],1,1);
x0 = linspace(-5,5,18);
y0 = 1./(1+x0.^2);
x  = linspace(-5,5,100);

%original
y1 = 1./(1+x.^2);

%lagrange
y2 = lagrange(x0,y0,x);

%pl
x3  = linspace(-5,5,20);
y3 = pl(20,-5,5);

%draw
plot(x,y1);
hold on 
plot(x,y2);
hold on 
plot(x3,y3);
ylabel('y(x)&Ln(x)&pl(x)');
legend('y(x)','Ln(x)','pl(x)');
title('origin&lagrange&piecewise linear');

%draw additional points
hold on
