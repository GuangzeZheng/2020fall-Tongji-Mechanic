clc;

%学号
SN=1851960;
%确定四个独立数
N1=mod(SN,5);
N2=mod(SN,7);
N3=mod(SN,9);
N4=mod(SN,11);
m1=3+N1;
m2=4+N2;
m3=5+N3;
eN1=0.05;
eN2=0.03;
eN3=0.02;
l1=1+N2/4;
l2=1+N3/4;
l3=1+N1/4;
l4=1+N4/4;
l=l1+l2+l3+l4;
%初始数据
EI=30000;
x10=0.02;
dotx20=0.3;
%质量矩阵
M=[m1 0 0;0 m2 0;0 0 m3];
%激励矩阵
%2s内
P1=[0;0;0];
%2s后
P2=[0;0;50];
%初始条件
X0=[0.02;0;0];
dotX0=[0;0.3;0];
%刚度矩阵
syms x
a=l1;
b=l2+l3+l4;
y1(x)=b*x/(6*EI*l)*(l^2-x^2-b^2);
y2(x)=b/(6*EI*l)*(x*(l^2-x^2-b^2)+l/b*(x-a)^3);
a11=y1(l1);
a21=y2(l1+l2);
a31=y2(l1+l2+l3);

a=l1+l2;
b=l3+l4;
y1(x)=b*x/(6*EI*l)*(l^2-x^2-b^2);
y2(x)=b/(6*EI*l)*(x*(l^2-x^2-b^2)+l/b*(x-a)^3);
a12=y1(l1);
a22=y1(l1+l2);
a32=y2(l1+l2+l3);

a=l1+l2+l3;
b=l4;
y1(x)=b*x/(6*EI*l)*(l^2-x^2-b^2);
y2(x)=b/(6*EI*l)*(x*(l^2-x^2-b^2)+l/b*(x-a)^3);
a13=y1(l1);
a23=y1(l1+l2);
a33=y1(l1+l2+l3);

A=[a11 a12 a13;a21 a22 a23;a31 a32 a33];
% vpa(A)
K=inv(A);

%%%%%%part 2

syms w x1 x2 x3;
Z_w=K-w^2*M;
w_n=vpa(solve(det(Z_w)==0,w));
w_1=w_n(4);
w_2=w_n(5);
w_3=w_n(6);
z1=subs(Z_w,w,w_1);
z2=subs(Z_w,w,w_2);
z3=subs(Z_w,w,w_3);
Z1=double(z1);
Z2=double(z2);
Z3=double(z3);
u(:,1)=null(Z1,'r');
u(:,2)=null(Z2,'r');
u(:,3)=null(Z3,'r');
M_p1=u(:,1)'*M*u(:,1);
M_p2=u(:,2)'*M*u(:,2);
M_p3=u(:,3)'*M*u(:,3);
u_1=1/sqrt(M_p1)*u(:,1);
u_2=1/sqrt(M_p2)*u(:,2);
u_3=1/sqrt(M_p3)*u(:,3);
% u_n=[0.20881 -0.375144 0.125162;0.264777 0.073113 -0.22593;0.130424 0.139662 0.201015];

u_n=[u_1 u_2 u_3];
x1111=vpa(inv(u_n)*[0.02;0;0],5);
x2222=vpa(inv(u_n)*[0;0.3;0],5);
l_1=1.5;
l_2=2;
l_3=1.25;
l_4=1.25;
x=[0 l_1 l_1+l_2 l_1+l_2+l_3 l_1+l_2+l_3+l_4];
xo=[0 l_1+l_2+l_3+l_4];
y1=[0 u_1' 0];
y2=[0 u_2' 0];
y3=[0 u_3' 0];
ho=[0 0];
% plot(x,y1,'color',[1,0,0],'lineStyle','-');
% hold on
% plot(x,y2,'color',[0,0,1],'lineStyle','-');
% hold on
% plot(x,y3,'color',[0,1,0],'lineStyle','-');
% hold on
% plot(xo,ho,'color',[0,1,1],'lineStyle','-');

% figure(1)
% plot(x,y1,'k-','LineWidth',2,'Marker','o','MarkerFaceColor','k','MarkerSize',8)
% xlabel('Position')
% title('系统振型图')
% set(gca,'FontSize',15)
% figure(2)
% plot(x,y2,'k-','LineWidth',2,'Marker','o','MarkerFaceColor','k','MarkerSize',8)
% xlabel('Position')
% set(gca,'FontSize',15)
% figure(3)
% plot(x,y3,'k-','LineWidth',2,'Marker','o','MarkerFaceColor','k','MarkerSize',8)
% xlabel('Position')
% set(gca,'FontSize',15)
% figure(4)
% hold on
% plot(x,y1,'b-','LineWidth',2,'Marker','o','MarkerFaceColor','b','MarkerSize',8)
% plot(x,y2,'g-','LineWidth',2,'Marker','o','MarkerFaceColor','g','MarkerSize',8)
% plot(x,y3,'r-','LineWidth',2,'Marker','o','MarkerFaceColor','r','MarkerSize',8)
% hold off
% set(gca,'FontSize',15)
% legend('一阶','二阶','三阶')





%%%%%%part 3

z_1=0.05;z_2=0.03;z_3=0.02;
K_n=[w_1^2 0 0;0 w_2^2 0; 0 0 w_3^2];
C_n=[2*z_1*w_1 0 0; 0 2*z_2*w_2 0; 0 0 2*z_3*w_3];
P_n=u_n'*[0;0;1];
x_n=inv(u_n)*[0.02;0;0];
x_nn=inv(u_n)*[0;0.3;0];




%%%%%%part 4

%N
w_d1=w_1*sqrt(1-z_1^2);
A_1=vpa(sqrt(((x_nn(1)+z_1*w_1*x_n(1))/w_d1)^2+(x_n(1))^2),5);
theta_1=vpa(atan((x_n(1)*w_d1)/(x_nn(1)+z_1*w_1*x_n(1))),5);

w_d2=w_2*sqrt(1-z_2^2);
A_2=vpa(sqrt(((x_nn(2)+z_2*w_2*x_n(2))/w_d2)^2+(x_n(2))^2),5);
% A_2=-A_2;
theta_2=vpa(atan((x_n(2)*w_d2)/(x_nn(2)+z_2*w_2*x_n(2))),5);
%check atant
theta_2=theta_2-pi;

w_d3=w_3*sqrt(1-z_3^2);
A_3=vpa(sqrt(((x_nn(3)+z_3*w_3*x_n(3))/w_d3)^2+(x_n(3))^2),5);
% A_3=-A_3;
theta_3=vpa(atan((x_n(3)*w_d3)/(x_nn(3)+z_3*w_3*x_n(3))),5);
%check atant
theta_3=theta_3+pi;

syms t
x_n1=A_1*exp(-z_1*w_1*t)*sin(w_d1*t+theta_1);
x_n2=A_2*exp(-z_2*w_2*t)*sin(w_d2*t+theta_2);
x_n3=A_3*exp(-z_3*w_3*t)*sin(w_d3*t+theta_3);
% subplot(1,2,1)
% t=0:0.01:5;
% plot(t,subs(x_n3))
% title('系统正则坐标x_{N3}在0~5s响应')
% xlabel('t/s')
% ylabel('x_{N3}/m')
% subplot(1,2,2)
% t=0:0.001:0.2;
% plot(t,subs(x_n3))
% title('系统正则坐标x_{N3}在0~1s响应')
% xlabel('t/s')
% ylabel('x_{N3}/m')


% t=0:0.001:5;
% hold on
% figure(5)
% plot(t,subs(x_n1),'k-','LineWidth',2)
% title('x_{N1}(t)的时间历程图形')
% set(gca,'FontSize',20)
% xlabel('t');ylabel('x_{N1}(t)')
% figure(6)
% plot(t,subs(x_n2),'k-','LineWidth',2)
% title('x_{N2}(t)的时间历程图形')
% set(gca,'FontSize',20)
% xlabel('t');ylabel('x_{N2}(t)')
% figure(7)
% plot(t,subs(x_n3),'k-','LineWidth',2)
% title('x_{N3}(t)的时间历程图形')
% set(gca,'FontSize',20)
% xlabel('t');ylabel('x_{N3}(t)')
% figure(8)
% plot(t,subs(x_1),'k-','LineWidth',1.5)
% title('x_{1}(t)的时间历程图形')
% set(gca,'FontSize',20)
% xlabel('t');ylabel('x_{1}(t)')
% figure(9)
% plot(t,subs(x_2),'k-','LineWidth',1.5)
% title('x_{2}(t)的时间历程图形')
% set(gca,'FontSize',20)
% xlabel('t');ylabel('x_{2}(t)')
% figure(10)
% plot(t,subs(x_3),'k-','LineWidth',1.5)
% title('x_{3}(t)的时间历程图形')
% set(gca,'FontSize',20)
% xlabel('t');ylabel('x_{3}(t)')
% hold off




%ori
A_o1=u_n*[A_1;0;0];
A_o2=u_n*[0;A_2;0];
A_o3=u_n*[0;0;A_3];
x_1=A_o1(1)*exp(-z_1*w_1*t)*sin(w_d1*t+theta_1)+A_o2(1)*exp(-z_2*w_2*t)*sin(w_d2*t+theta_2)+A_o3(1)*exp(-z_3*w_3*t)*sin(w_d3*t+theta_3);
x_2=A_o1(2)*exp(-z_1*w_1*t)*sin(w_d1*t+theta_1)+A_o2(2)*exp(-z_2*w_2*t)*sin(w_d2*t+theta_2)+A_o3(2)*exp(-z_3*w_3*t)*sin(w_d3*t+theta_3);
x_3=A_o1(3)*exp(-z_1*w_1*t)*sin(w_d1*t+theta_1)+A_o2(3)*exp(-z_2*w_2*t)*sin(w_d2*t+theta_2)+A_o3(3)*exp(-z_3*w_3*t)*sin(w_d3*t+theta_3);
% subplot(1,2,1)
% t=0:0.01:5;
% plot(t,subs(x_3))
% title('系统原始坐标x_{3}在0~5s响应')
% xlabel('t/s')
% ylabel('x_{3}/m')
% subplot(1,2,2)
% t=0:0.001:1;
% plot(t,subs(x_3))
% title('系统原始坐标x_{3}在0~1s响应')
% xlabel('t/s')
% ylabel('x_{3}/m')


% t=0:0.001:1;
% hold on
% figure(5)
% plot(t,subs(x_n1),'k-','LineWidth',2)
% title('x_{N1}(t)的局部放大图形')
% set(gca,'FontSize',20)
% xlabel('t');ylabel('x_{N1}(t)')
% figure(6)
% plot(t,subs(x_n2),'k-','LineWidth',2)
% title('x_{N2}(t)的局部放大图形')
% set(gca,'FontSize',20)
% xlabel('t');ylabel('x_{N2}(t)')
% figure(7)
% plot(t,subs(x_n3),'k-','LineWidth',2)
% title('x_{N3}(t)的局部放大图形')
% set(gca,'FontSize',20)
% xlabel('t');ylabel('x_{N3}(t)')
% figure(8)
% plot(t,subs(x_1),'k-','LineWidth',1.5)
% title('x_{1}(t)的局部放大图形')
% set(gca,'FontSize',20)
% xlabel('t');ylabel('x_{1}(t)')
% figure(9)
% plot(t,subs(x_2),'k-','LineWidth',1.5)
% title('x_{2}(t)的局部放大图形')
% set(gca,'FontSize',20)
% xlabel('t');ylabel('x_{2}(t)')
% figure(10)
% plot(t,subs(x_3),'k-','LineWidth',1.5)
% title('x_{3}(t)的局部放大图形')
% set(gca,'FontSize',20)
% xlabel('t');ylabel('x_{3}(t)')
% hold off





%%%%%%part 5

%dhm int
syms tau
x_til_1_in=exp(-z_1*w_1*(t-tau))*sin(w_d1*(t-tau));
x_til_1_f=50*u_n(3,1)/w_d1*int(x_til_1_in,tau,0, t);
x_til_1_b=50*u_n(3,1)/w_d1*int(x_til_1_in,tau,0, 2);






x_til_2_in=exp(-z_2*w_2*(t-tau))*sin(w_d2*(t-tau));
x_til_2_f=50*u_n(3,2)/w_d2*int(x_til_2_in,tau,0, t);
x_til_2_b=50*u_n(3,2)/w_d2*int(x_til_2_in,tau,0, 2);


x_til_3_in=exp(-z_3*w_3*(t-tau))*sin(w_d3*(t-tau));
x_til_3_f=50*u_n(3,3)/w_d3*int(x_til_3_in,tau,0, t);
x_til_3_b=50*u_n(3,3)/w_d3*int(x_til_3_in,tau,0, 2);


%绘图
t=0:0.001:2;
plot(t,subs(x_til_3_f+x_n3),'b');
hold on
t=2:0.001:5;
plot(t,subs(x_til_3_b+x_n3),'b');
xlabel('t/s')
ylabel('x/m')
hold on
t=0:0.001:5;
plot(t,subs(x_n3),'r')
hold on
t=0:0.001:2;
plot(t,subs(x_til_3_f),'b');
hold on
t=2:0.001:5;
plot(t,subs(x_til_3_b),'b');
xlabel('t/s')
ylabel('x/m')

subplot(1,2,1)
t=0:0.001:0.2;
plot(t,subs(x_til_3_f),'b')
hold on
plot(t,subs(x_n3),'r')
hold on
plot(t,subs(x_n3+x_til_3_f),'g')
title('x_{N3}在0~0.2s局部放大图')
xlabel('t/s')
ylabel('x/m')
subplot(1,2,2)
t=2:0.001:2.2;
plot(t,subs(x_til_3_b),'b')
hold on
plot(t,subs(x_n3),'r')
hold on
plot(t,subs(x_n3+x_til_3_b),'g')
title('x_{N3}在2~2.2s局部放大图')
xlabel('t/s')
ylabel('x/m')


x_til_n_f=[x_til_1_f;x_til_2_f;x_til_3_f];
x_til_n_b=[x_til_1_b;x_til_2_b;x_til_3_b];
x_til_f=u_n*x_til_n_f;
x_til_b=u_n*x_til_n_b;

x1_til_f=x_til_f(1);
x1_til_b=x_til_b(1);
x2_til_f=x_til_f(2);
x2_til_b=x_til_b(2);
x3_til_f=x_til_f(3);
x3_til_b=x_til_b(3);


vpa(x_til_n_b,5)




figure(1)
t=0:0.001:2;
a=plot(t,subs(x_til_f(3)),'Color',[0.25,1,1],'linewidth',1.5);
hold on
t=2:0.001:5;
b=plot(t,subs(x_til_b(3)),'Color',[0.25,1,1],'linewidth',1.5);
xlabel('t/s')
ylabel('x/m')
hold on 
t=0:0.001:5;
c=plot(t,subs(x_3),'Color',[1,0.84,0],'linewidth',1.5);
leg=legend([b,c],'$\widetilde{x_{3}}$','$x_{h3}$');
set(leg,'FontSize',15,'Interpreter','latex');  % 设置对象的翻译器为latex
hold on

figure(2)
t=0:0.002:2;
plot(t,subs(x_til_f(3)+x_3),'Color',[0,0,0],'linewidth',1);
hold on
t=2:0.002:5;
plot(t,subs(x_til_b(3)+x_3),'Color',[0,0,0],'linewidth',1);
xlabel('t/s')
ylabel('x/m')
leg2=legend('$x_{3}$');
set(leg2,'FontSize',15,'Interpreter','latex');  % 设置对象的翻译器为latex











t=0:0.001:2;
a=plot(t,subs(x_til_f(3)),'Color',[0.25,1,1],'linewidth',1.5);
hold on
t=2:0.001:5;
b=plot(t,subs(x_til_b(3)),'Color',[0.25,1,1],'linewidth',1.5);
xlabel('t/s')
ylabel('x/m')
hold on 
t=0:0.001:5;
c=plot(t,subs(x_3),'Color',[1,0.84,0],'linewidth',1.5);

hold on

t=0:0.001:2;
e=plot(t,subs(x_til_f(3)+x_3),'Color',[0,0,0],'linewidth',1.5);
hold on
t=2:0.001:5;
plot(t,subs(x_til_b(3)+x_3),'Color',[0,0,0],'linewidth',1.5);
xlabel('t/s')
ylabel('x/m')

leg=legend([b,c,e],'$\widetilde{x_{3}}$','$x_{h3}$','$x_{3}$');
set(leg,'FontSize',15,'Interpreter','latex');  % 设置对象的翻译器为latex
