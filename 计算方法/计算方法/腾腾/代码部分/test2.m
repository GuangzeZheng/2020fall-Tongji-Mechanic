clear;
rand('seed',1851960);
n=50;
x=zeros(1,n+1);
y=zeros(1,n+1);
x(1)=0;
y(1)=1;
h=0.01;
a=randi(5,1,1);

for i=1:n
    x(i+1)=x(i)+h;
    y(i+1)=runge_kutta(@f,x(i),y(i),h);
end

y2 = dsolve('Dy=-a*y+a*x*x+a*x','y(0)=1','x');            % ¾«È·½â
y2 = subs(y2,'a',a);
y2 = subs(y2,'x',x);

plot(x,y,'linewidth',2)
hold on
plot(x,y2,'-.','linewidth',2)
legend('Runge','exact')
