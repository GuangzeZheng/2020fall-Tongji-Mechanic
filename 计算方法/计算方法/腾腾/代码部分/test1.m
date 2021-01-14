clear;
rand('seed',1851960);
a = 1+2*rand(1);

f = @(x,y)a*x-y+1;
h = 0.1;
n = 1/h;
x = zeros(1,n+1);
y1 = zeros(1,n+1);              % 欧拉法
y2 = zeros(1,n+1);              % 改进欧拉法
x(1) = 0;
y1(1) = 1;
y2(1) = 1;
for k =1:n
    x(k+1) = x(1)+h*k;
    y1(k+1) = y1(k)+h*f(x(k),y1(k));
    y2(k+1) = y2(k)+h*f(x(k),y2(k));
    y2(k+1) = y2(k)+h/2*(f(x(k),y2(k))+f(x(k+1),y2(k+1)));
end
y3 = dsolve('Dy=b*x-y+1','y(0)=1','x');            % 精确解
y3 = subs(y3,'b',a);
y3 = subs(y3,'x',x);
figure(1);

plot(x,y1,'--','linewidth',2)
hold on
plot(x,y2,'-.','linewidth',2)
hold on
plot(x,y3,'-','linewidth',2)
legend('Euler','Euler+','exact')

xlabel('x');
ylabel('y');
grid on;

