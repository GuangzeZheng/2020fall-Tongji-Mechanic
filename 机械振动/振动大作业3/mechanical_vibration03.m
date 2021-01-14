clc,clear;
xh=1851960;
N1=mod(xh,5);
N2=mod(xh,7);
N3=mod(xh,9);
N4=mod(xh,11);
m1=3+N1;
m2=4+N2;
m3=5+N3;
l1=1+N2/4;
l2=1+N3/4;
l3=1+N1/4;
l4=1+N4/4;
l=l1+l2+l3+l4;
EI=30000;
x10=0.02;
x20_diff=0.3;
X0=[x10;0;0];
X0_diff=[0;x20_diff;0];
zeta1=0.05;
zeta2=0.03;
zeta3=0.02;
C=[zeta1,0,0;0,zeta2,0;0,0 zeta3];
xm1=l1;
xm2=l1+l2;
xm3=l1+l2+l3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=xm1;%m1
a11=Flexible(xm1,a,l,EI);%(x,a,l,EI)
a21=Flexible(xm2,a,l,EI);
a31=Flexible(xm3,a,l,EI);

a=xm2;%m2
a12=Flexible(xm1,a,l,EI);
a22=Flexible(xm2,a,l,EI);
a32=Flexible(xm3,a,l,EI);

a=xm3;%m3
a13=Flexible(xm1,a,l,EI);
a23=Flexible(xm2,a,l,EI);
a33=Flexible(xm3,a,l,EI);

a_matrix=[a11,a12,a13;a21,a22,a23;a31,a32,a33];
K=inv(a_matrix);
M=[m1,0,0;0,m2,0;0,0,m3];
ft=[0,0,1];
syms w;
Zw=K-w^2*M;
wn=vpa(solve(det(Zw)==0,w));
w1=wn(1);
w2=wn(2);
w3=wn(3);
u1=adjoint(K-w1^2*M);
u2=adjoint(K-w2^2*M);
u3=adjoint(K-w3^2*M);
[ro1,li1]=find(abs(u1)==max(max(abs(u1))));
[ro2,li2]=find(abs(u2)==max(max(abs(u2))));
[ro3,li3]=find(abs(u3)==max(max(abs(u3))));
u(:,1)=u1(:,li1);
u(:,2)=u2(:,li2);
u(:,3)=u3(:,li3);
u_1(:,1)=u(:,1)/u(1,1);
u_1(:,2)=u(:,2)/u(1,2);
u_1(:,3)=u(:,3)/u(1,3);
Mp=u_1'*M*u_1;
for i=1:3
    uN(:,i)=Mp(i,i)^(-0.5)*u_1(:,i);
end
%%%%%%%%
point=0:4;
figure()
plot(point,[0 u_1(:,1)' 0],'black- ','LineWidth',3,'Marker','o','MarkerSize',4)
xlabel('Position')
ylabel('Amplitude');
title('一阶振型图');
axis([0 4 -1 1.5]);
grid on;

figure()
plot(point,[0 u_1(:,2)' 0],'black- ','LineWidth',3,'Marker','o','MarkerSize',4)
xlabel('Position')
ylabel('Amplitude');
title('二阶振型图');
axis([0 4 -1 1.5]);
grid on;

figure()
plot(point,[0 u_1(:,3)' 0],'black- ','LineWidth',3,'Marker','o','MarkerSize',4)
xlabel('Position')
ylabel('Amplitude');
title('三阶振型图');
axis([0 4 -1 1.5]);
grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MN=uN'*M*uN;
KN=uN'*K*uN;
CN=[2*zeta1*w1,0,0;0,2*zeta2*w2,0;0,0,2*zeta3*w3];
X0N=inv(uN)*X0;
X0N_diff=inv(uN)*X0_diff;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xN1=vpa(dsolve('D2y+0.94928*Dy+90.113*y=0','y(0)=0.0096311,Dy(0)=0.066535'));
xN2=vpa(dsolve('D2y+3.8888*Dy+4200.9*y=0','y(0)=0.028106,Dy(0)=0.18435'));
xN3=vpa(dsolve('D2y+6.0188*Dy+22641*y=0','y(0)=0.017812,Dy(0)=-0.65064'));
xN=vpa([xN1;xN2;xN3],6);
x=vpa(uN*xN,6);
%%%%%%%%%%%
t=0:0.001:5;
figure();
plot(t,double(subs(xN1,t)),'black');
title('正则坐标稳态响应时间历程图');
xlabel('Time/s');
ylabel('Amplitude');
legend('x_{N1}(t)');
grid on;

figure();
plot(t,double(subs(xN2,t)),'black');
grid on;
title('正则坐标稳态响应时间历程图');
xlabel('Time/s');
ylabel('Amplitude');
legend('x_{N2}(t)');

figure();
plot(t,double(subs(xN3,t)),'black');
grid on;
title('正则坐标稳态响应时间历程图');
xlabel('Time/s');
ylabel('Amplitude');
legend('x_{N3}(t)');

figure();
plot(t,double(subs(x(1),t)),'black');
grid on;
title('原始坐标稳态响应时间历程图');
xlabel('Time/s');
ylabel('Amplitude');
legend('x_{1}(t)');

figure();
plot(t,double(subs(x(2),t)),'black');
grid on;
title('原始坐标稳态响应时间历程图');
xlabel('Time/s');
ylabel('Amplitude');
legend('x_{2}(t)');

figure();
plot(t,double(subs(x(3),t)),'black');
grid on;
title('原始坐标稳态响应时间历程图');
xlabel('Time/s');
ylabel('Amplitude');
legend('x_{3}(t)');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
zeta=[zeta1,zeta2,zeta3];
p=uN'*[0;0;50];
wd=[0 0 0];
for i=1:3
    wd(i)=wn(i)*(1-zeta(i)^2)^0.5;
end
xdu1=sym(zeros(3,1));
xdu2=sym(zeros(3,1));
syms x5 t;
for i=1:3
    xdu1(i)=int(p(i)*exp(-zeta(i)*wn(i)*(t-x5))*sin(wd(i)*(t-x5))/wd(i),0,t);%t<=2s
    xdu2(i)=int(p(i)*exp(-zeta(i)*wn(i)*(t-x5))*sin(wd(i)*(t-x5))/wd(i),0,2);%t>2s
end
%0-2
xN_all_02=xdu1+xN;
x_all_02=uN*xN_all_02;
%2-5
xN_all_25=xdu2+xN;
x_all_25=uN*xN_all_25;

t=0:0.001:5;
figure();
plot(t,double([subs(xN_all_02(1),[0:0.001:2]),subs(xN_all_25(1),[2.001:0.001:5])]),'black');
grid on;
title('正则坐标瞬态响应时间历程图');
xlabel('Time/s');
ylabel('Amplitude');
legend('x_{N1}(t)');

figure();
plot(t,double([subs(xN_all_02(2),[0:0.001:2]),subs(xN_all_25(2),[2.001:0.001:5])]),'black');
grid on;
title('正则坐标瞬态响应时间历程图');
xlabel('Time/s');
ylabel('Amplitude');
legend('x_{N2}(t)');

figure();
plot(t,double([subs(xN_all_02(3),[0:0.001:2]),subs(xN_all_25(3),[2.001:0.001:5])]),'black');
grid on;
title('正则坐标瞬态响应时间历程图');
xlabel('Time/s');
ylabel('Amplitude');
legend('x_{N3}(t)');

figure();
plot(t,double([subs(x_all_02(1),[0:0.001:2]),subs(x_all_25(1),[2.001:0.001:5])]),'black');
grid on;
title('原始坐标瞬态响应时间历程图');
xlabel('Time/s');
ylabel('Amplitude');
legend('x_{1}(t)');

figure();
plot(t,double([subs(x_all_02(2),[0:0.001:2]),subs(x_all_25(2),[2.001:0.001:5])]),'black');
grid on;
title('原始坐标瞬态响应时间历程图');
xlabel('Time/s');
ylabel('Amplitude');
legend('x_{2}(t)');

figure();
plot(t,double([subs(x_all_02(3),[0:0.001:2]),subs(x_all_25(3),[2.001:0.001:5])]),'black');
grid on;
title('原始坐标瞬态响应时间历程图');
xlabel('Time/s');
ylabel('Amplitude');
legend('x_{3}(t)');


