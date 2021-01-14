%exp 2020/11/7 zgz
rand('seed',1851960);
%points
a = 0.5+2.5*rand(1,6);
b = 1.5+7*rand(1,6);

%fit
p = polyfit(a,b,2);

%construct coordinates
x = linspace(0.5,3,25);
y = polyval(p,x);

%draw
plot(x,y);
ylabel('');
title('Least Square');
hold on 

%draw additional points
for i = 1:6
    plot(a(i),b(i),'.','MarkerSize',14);
    hold on
end

