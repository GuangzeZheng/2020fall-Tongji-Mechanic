%GXY1853154.main
syms  x1 x2 x3 x4 y1 y2 y3 y4 y x t;
c=3000;k=20000;m=1200;                   %求固有参数
N1=0;N2=5;N3=3;
w1=2*pi;w2=4*pi;w3=8*pi;
wn=sqrt(k/m);r=c/(2*sqrt(m*k));
r1=w1/wn;r2=w2/wn;r3=w3/wn;              %计算频率比
y1(t)=k*N1*sin(w1*t)+c*N1*w1*cos(w1*t);    %分解为三个激励
y2(t)=k*N2*sin(w2*t+pi/2)+c*N2*w2*cos(w2*t+pi/2);
y3(t)=k*N3*sin(w3*t+pi/3)+c*N3*w3*cos(w3*t+pi/3);
x1(t)=wei(N1*k,k,r1,r)*sin(w1*t+xiang(r,r1))+wei(c*N1*w1,k,r1,r)*cos(w1*t+xiang(r,r1));%不同激励下的响应函数
x2(t)=wei(N2*k,k,r2,r)*sin(w2*t+pi/2+xiang(r,r2))+wei(c*N2*w2,k,r2,r)*cos(w2*t+pi/2+xiang(r,r2));
x3(t)=wei(N3*k,k,r3,r)*sin(w3*t+pi/3+xiang(r,r3))+wei(c*N3*w3,k,r3,r)*cos(w3*t+pi/3+xiang(r,r3));
y(t)=N1*sin(w1*t)+N2*sin(w2*t+pi/2)+N3*sin(w3*t+pi/3);           
x(t)=x1+x2+x3;                            %响应函数
x4(t)=diff(x,2);                          %求加速度的函数
y4(t)=diff(y,2);
t=0:0.01:2;
x4=x4(t);y4=y4(t);
y=y(t);x=x(t);

figure(1)                               %响应与激励的图像        
plot(t,y,'-',t,x,'--')
hold on
xlabel('t/s');
ylabel('x-y/10^{-3} m');
title('激励y(t)与响应x(t)的时间历程图像');
legend('y(t)','x(t)')

figure(2)                             %响应加速度与激励加速度的图像
plot(t,x4,'-',t,y4,'--')
title('激励与响应的加速度图')
xlabel('t/s')
ylabel('加速度/10^{-3}(m/s^2)')
legend('激励','响应')

w=0:0.01:10*pi;                      %幅频与相频函数的图像
p=k/m;
L= (sqrt((c.* w ).^2 + k^2)) ./...   %幅频特性曲线函数
    (sqrt((k-m.*w.^2).^2 + (c .* w).^2));
figure(3)
plot(w,L)
grid on
hold on
title('幅频特性曲线')
xlabel('w/(rad/s)')
ylabel('|H_{y,x}(w)|')
     
n= -180+(atan((c*w)./k))*180/pi+90+... %画相频特性曲线
(((atan(c*w)./k)-(atan((c*w)./(k-m*(w.*w)))))*180/pi+90).*(w.*w<p)+...
    (((atan(c*w)./k)-(atan((c*w)./(k-m*(w.*w)))))*180/pi-90).*(w.*w>p);%利用条件式表示相频函数
figure (4)
hold on
plot(w,n)
grid on
axis([0 10*pi -180 0]);
title('相频特性曲线')
xlabel('w/(rad/s)')
ylabel('\theta /（^\circ）')

figure(5)                  %不同阻尼比下幅频特性曲线函数
hold on
for p=[0.2,0.3,0.4,r]
    b=0:0.01:5;
    n1= (sqrt((2*p.*b).^2 + 1)) ./...   
         (sqrt((1-b.^2).^2 + (2*p.* b).^2));
    plot(b,n1)
    grid on
    hold on
end
title('幅频特性曲线')
xlabel('频率比')
ylabel('|H_{y,x}(w)|')
legend('0.2','0.3','0.4','0.258')

figure(6)                    %前后加速度的对比
hold on
x6=respondacclerate(4900,75000,1200,N1,N2,N3);
plot(t,x4,'-',t,x6,'--')
grid on
title('k、c改变前后响应的加速度图')
xlabel('t/s')
ylabel('加速度/10^{-3}(m/s^2)')
legend('k、c改前','k、c改后')

figure(7)
L1=respondfupin(4900,75000,1200);
plot(w,L,'-',w,L1,'--')
grid on
hold on
title('k、c改变前后响应的幅频特性曲线')
xlabel('w/(rad/s)')
ylabel('|H_{y,x}(w)|')
legend('k、c改前','k、c改后')

figure(8)                               %改后响应与改前的图像       
x5=respondzhuhan(4900,75000,1200,N1,N2,N3);
plot(t,x,'-',t,x5,'--')
hold on
xlabel('t/s');
ylabel('x-y/10^{-3} m');
title('k、c前后响应x(t)的时间历程图像');
legend('k、c改前','k、c改后')







