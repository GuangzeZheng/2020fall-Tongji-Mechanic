%part1
clc
clear
syms w
y=zeros(3,3);
par=1851960;
N1=mod(par,5);
N2=mod(par,7);
N3=mod(par,9);
N4=mod(par,11);
m1=3+N1;
m2=4+N2;
m3=5+N3;
l1=1+N2/4;
l2=1+N3/4;
l3=1+N1/4;
l4=1+N4/4;
l=l1+l2+l3+l4;
EI=30000;
x=[l1 l1+l2 l1+l2+l3];
j=1;

%part2
for b=[l2+l3+l4 l3+l4 l4]
    a=l-b;
    for i=1:3
        if j==1
            if i==1
                y(i,j)=b*x(i)*(l^2-x(i)^2-b^2)/(6*EI*l);
            else
                y(i,j)=b*((l^2-b^2)*x(i)-x(i)^3+l*(x(i)-a)^3/b)/(6*EI*l);
            end
        end
        if j==2
            if i<=2
                y(i,j)=b*x(i)*(l^2-x(i)^2-b^2)/(6*EI*l);
            else
                y(i,j)=b*((l^2-b^2)*x(i)-x(i)^3+l*(x(i)-a)^3/b)/(6*EI*l);
            end
        end
        if j==3
    y(i,j)=b*x(i)*(l^2-x(i)^2-b^2)/(6*EI*l);
        end
    end
    j=j+1;
end
a=y;%柔度矩阵
K=inv(a);%刚度矩阵
M=[m1 0 0;0 m2 0;0 0 m3];%质量矩阵
%求解质量矩阵和刚度矩阵

syms w
w_n=solve(vpa(det(K-w^2*M),3)==0,w);%求解固有频率
n=length(w_n);
u=zeros(3,3);
k=1;
for i=1:n
if w_n(i)>0
Z=vpa(K-w_n(i)^2*M,3);
adj=vpa(det(Z)*inv(Z),3);
max=1;
for t=1:3
if abs(adj(1,t))>abs(adj(1,max))
max=t;
end
end
u(:,k)=adj(:,max);
k=k+1;
end
end
%求解振型矩阵
u_1=zeros(3,3);
for m=1:3
u_1(:,m)=u(:,m)/u(1,m);
end
%振型矩阵归一化
z=0:4;
figure(1)
plot(z,[0 u_1(:,1)' 0],'k-','LineWidth',2,'Marker','o','MarkerFaceColor','k','MarkerSize',8)
xlabel('Position')
title('系统振型图')
set(gca,'FontSize',15)
figure(2)
plot(z,[0 u_1(:,2)' 0],'k-','LineWidth',2,'Marker','o','MarkerFaceColor','k','MarkerSize',8)
xlabel('Position')
set(gca,'FontSize',15)
figure(3)
plot(z,[0 u_1(:,3)' 0],'k-','LineWidth',2,'Marker','o','MarkerFaceColor','k','MarkerSize',8)
xlabel('Position')
set(gca,'FontSize',15)
figure(4)
hold on
plot(z,[0 u_1(:,1)' 0],'b-','LineWidth',2,'Marker','o','MarkerFaceColor','b','MarkerSize',8)
plot(z,[0 u_1(:,2)' 0],'g-','LineWidth',2,'Marker','o','MarkerFaceColor','g','MarkerSize',8)
plot(z,[0 u_1(:,3)' 0],'r-','LineWidth',2,'Marker','o','MarkerFaceColor','r','MarkerSize',8)
hold off
set(gca,'FontSize',15)
legend('一阶','二阶','三阶')
%绘制振型图
M_p=zeros(3,1);
u_N=zeros(3,3);
for i=1:3
M_p(i)=M(1,1)*u_1(1,i)^2+M(2,2)*u_1(2,i)^2+M(3,3)*u_1(3,i)^2;
u_N(:,i)=u_1(:,i)/sqrt(M_p(i));
end
%求正则振型矩阵
c=[0.05 0.03 0.02];
K_N=u_N'*K*u_N;%正则刚度矩阵
C_N=double(vpa([2*w_n(4)*c(1) 0 0;0 2*w_n(5)*c(2) 0;0 0 2*w_n(6)*c(3)],3));%正则阻尼矩阵
x_N0=inv(u_N)*[0.02;0;0];
v_N0=inv(u_N)*[0;0.3;0];


%PART 4
x_N1=vpa(dsolve('D2y+0.9837*Dy+96.8*y=0','y(0)=0.0184','Dy(0)=0.6180','t'),3);
x_N2=vpa(dsolve('D2y+2.6615*Dy+1967.7*y=0','y(0)=0.0372','Dy(0)=0.1410','t'),3);
x_N3=vpa(dsolve('D2y+3.8754*Dy+9386.9*y=0','y(0)=0.0260','Dy(0)=-0.6389','t'),3);
%解微分方程组
x_N=vpa([x_N1;x_N2;x_N3],3);%正则坐标
x=vpa(u_N*x_N,2);%原始坐标
x_N1=matlabFunction(x_N(1));
x_N2=matlabFunction(x_N(2));
x_N3=matlabFunction(x_N(3));
x_1=matlabFunction(x(1));
x_2=matlabFunction(x(2));
x_3=matlabFunction(x(3));
t=0:0.001:5;
hold on
figure(5)
plot(t,x_N1(t),'k-','LineWidth',2)
title('x_{N1}(t)的时间历程图形')
set(gca,'FontSize',20)
xlabel('t');ylabel('x_{N1}(t)')
figure(6)
plot(t,x_N2(t),'k-','LineWidth',2)
title('x_{N2}(t)的时间历程图形')
set(gca,'FontSize',20)
xlabel('t');ylabel('x_{N2}(t)')
figure(7)
plot(t,x_N3(t),'k-','LineWidth',2)
title('x_{N3}(t)的时间历程图形')
set(gca,'FontSize',20)
xlabel('t');ylabel('x_{N3}(t)')
figure(8)
plot(t,x_1(t),'k-','LineWidth',2)
title('x_{1}(t)的时间历程图形')
set(gca,'FontSize',20)
xlabel('t');ylabel('x_{1}(t)')
figure(9)
plot(t,x_2(t),'k-','LineWidth',2)
title('x_{2}(t)的时间历程图形')
set(gca,'FontSize',20)
xlabel('t');ylabel('x_{2}(t)')
figure(10)
plot(t,x_3(t),'k-','LineWidth',2)
title('x_{3}(t)的时间历程图形')
set(gca,'FontSize',20)
xlabel('t');ylabel('x_{3}(t)')
hold off
%绘制自由振动时间历程图形
%PART 5
w_d=zeros(3);
w=zeros(3);
for i=1:3
w(i)=w_n(i+3);
end
for i=1:3
w_d(i)=w_n(i+3)*sqrt(1-c(i)^2);
end
syms x t xb_t xb_0
for i=1:3
xb_t(i)=int(50*exp(-c(i)*w(i)*(t-x))*sin(w_d(i)*(t-x)),0,t)/M(i,i)*w_d(i);%t<=2s
xb_0(i)=int(50*exp(-c(i)*w(i)*(t-x))*sin(w_d(i)*(t-x)),0,2)/M(i,i)*w_d(i);%t>2s
end
%杜哈美积分
xb_t=vpa(xb_t,3);
xb_0=vpa(xb_0,3);
%求解激励力作用下强迫振动响应
f1=matlabFunction(xb_t(1));
f2=matlabFunction(xb_t(2));
f3=matlabFunction(xb_t(3));
f_1=matlabFunction(xb_0(1));
f_2=matlabFunction(xb_0(2));
f_3=matlabFunction(xb_0(3));
f=xb_t;
f_=xb_0;
fN=inv(u_N)*f';
f_N=inv(u_N)*f_';
%对强迫振动响应进行正则变换
fN1=matlabFunction(fN(1));
fN2=matlabFunction(fN(2));
fN3=matlabFunction(fN(3));
f_N1=matlabFunction(f_N(1));
f_N2=matlabFunction(f_N(2));
f_N3=matlabFunction(f_N(3));
figure(11)
hold on
t=0:0.001:2;
plot(t,fN1(t)+x_N1(t),'k-','LineWidth',2)
t=2:0.001:5;
plot(t,f_N1(t)+x_N1(t),'k-','LineWidth',2)
hold off
21
title('x_{N1}(t)的时间历程图形')
set(gca,'FontSize',20)
xlabel('t');ylabel('x_{N1}(t)')
figure(12)
hold on
t=0:0.001:2;
plot(t,fN2(t)+x_N2(t),'k-','LineWidth',2)
t=2:0.001:5;
plot(t,f_N2(t)+x_N2(t),'k-','LineWidth',2)
hold off
title('x_{N2}(t)的时间历程图形')
set(gca,'FontSize',20)
xlabel('t');ylabel('x_{N2}(t)')
figure(13)
hold on
t=0:0.001:2;
plot(t,fN3(t)+x_N3(t),'k-','LineWidth',2)
t=2:0.001:5;
plot(t,f_N3(t)+x_N3(t),'k-','LineWidth',2)
hold off
title('x_{N3}(t)的时间历程图形')
set(gca,'FontSize',20)
xlabel('t');ylabel('x_{N3}(t)')
figure(14)
hold on
t=0:0.001:2;
plot(t,f1(t)+x_1(t),'k-','LineWidth',2)
t=2:0.001:5;
plot(t,f_1(t)+x_1(t),'k-','LineWidth',2)
hold off
title('x_{1}(t)的时间历程图形')
set(gca,'FontSize',20)
xlabel('t');ylabel('x_{1}(t)')
figure(15)
hold on
t=0:0.001:2;
plot(t,f2(t)+x_2(t),'k-','LineWidth',2)
t=2:0.001:5;
plot(t,f_2(t)+x_2(t),'k-','LineWidth',2)
hold off
title('x_{2}(t)的时间历程图形')
set(gca,'FontSize',20)
xlabel('t');ylabel('x_{2}(t)')
figure(16)
22
hold on
t=0:0.001:2;
plot(t,f3(t)+x_3(t),'k-','LineWidth',2)
t=2:0.001:5;
plot(t,f_3(t)+x_3(t),'k-','LineWidth',2)
hold off
title('x_{3}(t)的时间历程图形')
set(gca,'FontSize',20)
xlabel('t');ylabel('x_{3}(t)')
hold off
%绘制时间响应图形
%END