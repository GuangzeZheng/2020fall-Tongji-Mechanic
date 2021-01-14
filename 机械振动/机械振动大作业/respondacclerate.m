function x4=respondacclerate(c,k,m,N1,N2,N3)
syms  x1 x2 x3 x4 y1 y2 y3 y4 y x t;     
w1=2*pi;w2=4*pi;w3=8*pi;                %求固有参数
wn=sqrt(k/m);r=c/(2*sqrt(m*k));
r1=w1/wn;r2=w2/wn;r3=w3/wn;             %计算频率比
y1(t)=k*N1*sin(w1*t)+c*N1*w1*cos(w1*t);   %分解为三个激励
y2(t)=k*N2*sin(w2*t+pi/2)+c*N2*w2*cos(w2*t+pi/2);
y3(t)=k*N3*sin(w3*t+pi/3)+c*N3*w3*cos(w3*t+pi/3);
x1(t)=wei(N1*k,k,r1,r)*sin(w1*t+xiang(r,r1))+wei(c*N1*w1,k,r1,r)*cos(w1*t+xiang(r,r1));%不同激励下的响应函数
x2(t)=wei(N2*k,k,r2,r)*sin(w2*t+pi/2+xiang(r,r2))+wei(c*N2*w2,k,r2,r)*cos(w2*t+pi/2+xiang(r,r2));
x3(t)=wei(N3*k,k,r3,r)*sin(w3*t+pi/3+xiang(r,r3))+wei(c*N3*w3,k,r3,r)*cos(w3*t+pi/3+xiang(r,r3));
y(t)=N1*sin(w1*t)+N2*sin(w2*t+pi/2)+N3*sin(w3*t+pi/3);           
x(t)=x1+x2+x3;                            %响应函数
x4(t)=diff(x,2);                          %求加速度的函数
t=0:0.01:2;
x4=x4(t);


