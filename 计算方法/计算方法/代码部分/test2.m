%实验二的主程序

clear;
n=50;
x=zeros(1,n+1);
y=zeros(1,n+1);
x(1)=0;
y(1)=1;
h=0.01;
for i=1:n
    x(i+1)=x(i)+h;
    y(i+1)=runge_kutta(@function2_generate,x(i),y(i),h);
end
plot(x,y,'linewidth',2)
