clc;

%ѧ��
SN=1852951;
%ȷ���ĸ�������
N1=mod(SN,5);N2=mod(SN,7);N3=mod(SN,9);N4=mod(SN,11);
m1=3+N1;m2=4+N2;m3=5+N3;
eN1=0.05;eN2=0.03;eN3=0.02;     %ģ̬�����
l1=1+N2/4;l2=1+N3/4;l3=1+N1/4;l4=1+N4/4;l=l1+l2+l3+l4;
EI=30000;x10=0.02;dotx20=0.3;%��ʼ����������
X0=[0.02;0;0];dotX0=[0;0.3;0];%�ѳ�ʼ����ת��Ϊ������ʽ
M=[m1 0 0;0 m2 0;0 0 m3];%��������
%2s��
P2=[0;0;50];%��������
%2s��
P1=[0;0;0];
%%%%��ȡ�նȾ���
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
w_1=abs(w_n(4));w_2=abs(w_n(5));w_3=abs(w_n(6));     %����Ƶ�ʵ����
z1=subs(Z_w,w,w_1);z2=subs(Z_w,w,w_2);z3=subs(Z_w,w,w_3);
Z1=double(z1);Z2=double(z2);Z3=double(z3);
u(:,1)=null(Z1,'r');u(:,2)=null(Z2,'r');u(:,3)=null(Z3,'r');
M_p1=u(:,1)'*M*u(:,1);M_p2=u(:,2)'*M*u(:,2);M_p3=u(:,3)'*M*u(:,3);
u_1=1/sqrt(M_p1)*u(:,1);u_2=1/sqrt(M_p2)*u(:,2);u_3=1/sqrt(M_p3)*u(:,3);
u_n=[u_1 u_2 u_3];              %����������
x1111=vpa(inv(u_n)*[0.02;0;0],5);
x2222=vpa(inv(u_n)*[0;0.3;0],5);
x=[0 l1 l1+l2 l1+l2+l3 l1+l2+l3+l4];
y1=[0 u_1' 0];y2=[0 u_2' 0];y3=[0 u_3' 0];

figure(1)             %һ������ͼ
plot(x,y1,'k-','LineWidth',2,'Marker','o','MarkerFaceColor','k','MarkerSize',8)
xlabel('Position')
title('ϵͳ����ͼ')
set(gca,'FontSize',15)
figure(2)           %��������ͼ
plot(x,y2,'k-','LineWidth',2,'Marker','o','MarkerFaceColor','k','MarkerSize',8)
xlabel('Position')
set(gca,'FontSize',15)
figure(3)           %��������ͼ
plot(x,y3,'k-','LineWidth',2,'Marker','o','MarkerFaceColor','k','MarkerSize',8)
xlabel('Position')
set(gca,'FontSize',15)
figure(4)    %������ͼ��ʾ��һ��ͼ��
hold on
plot(x,y1,'b-','LineWidth',2,'Marker','o','MarkerFaceColor','b','MarkerSize',8)
plot(x,y2,'g-','LineWidth',2,'Marker','o','MarkerFaceColor','g','MarkerSize',8)
plot(x,y3,'r-','LineWidth',2,'Marker','o','MarkerFaceColor','r','MarkerSize',8)
hold off
set(gca,'FontSize',15)
legend('һ��','����','����')

%%%%%%part 3

z_1=0.05;z_2=0.03;z_3=0.02;
K_n=[w_1^2 0 0;0 w_2^2 0; 0 0 w_3^2];
C_n=[2*z_1*w_1 0 0; 0 2*z_2*w_2 0; 0 0 2*z_3*w_3];
P_n=u_n'*[0;0;1];
x_n=inv(u_n)*[0.02;0;0];  %�任��ĳ�ʼ����
x_nn=inv(u_n)*[0;0.3;0];

%%%%%part 4%��ȡ���������µ���Ӧ
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
x_n1=A_1*exp(-z_1*w_1*t)*sin(w_d1*t+theta_1);     %ϵͳ��������ı��ʽ
x_n2=A_2*exp(-z_2*w_2*t)*sin(w_d2*t+theta_2);
x_n3=A_3*exp(-z_3*w_3*t)*sin(w_d3*t+theta_3);

% %ori    %��ȡԭʼ�������Ӧ
syms t1
A_o1=u_n*[A_1;0;0];A_o2=u_n*[0;A_2;0];A_o3=u_n*[0;0;A_3];
x_1=A_o1(1)*exp(-z_1*w_1*t)*sin(w_d1*t+theta_1)+A_o2(1)*exp(-z_2*w_2*t)*sin(w_d2*t+theta_2)+A_o3(1)*exp(-z_3*w_3*t)*sin(w_d3*t+theta_3);
x_2=A_o1(2)*exp(-z_1*w_1*t)*sin(w_d1*t+theta_1)+A_o2(2)*exp(-z_2*w_2*t)*sin(w_d2*t+theta_2)+A_o3(2)*exp(-z_3*w_3*t)*sin(w_d3*t+theta_3);
x_3=A_o1(3)*exp(-z_1*w_1*t)*sin(w_d1*t+theta_1)+A_o2(3)*exp(-z_2*w_2*t)*sin(w_d2*t+theta_2)+A_o3(3)*exp(-z_3*w_3*t)*sin(w_d3*t+theta_3);
% 
% %%%%%%part 5
% 
% %dhm int
syms tau 
x_til_1_in=exp(-z_1*w_1*(t-tau))*sin(w_d1*(t-tau));
x_til_1_f=50*u_n(3,1)/w_d1*int(x_til_1_in,tau,0, t);      %��0~ts�ڶŹ������֣�t<2)
x_til_1_b=50*u_n(3,1)/w_d1*int(x_til_1_in,tau,0, 2);      %��2~ts�ڶŹ������� (t>2)

x_til_2_in=exp(-z_2*w_2*(t-tau))*sin(w_d2*(t-tau));
x_til_2_f=50*u_n(3,2)/w_d2*int(x_til_2_in,tau,0, t);
x_til_2_b=50*u_n(3,2)/w_d2*int(x_til_2_in,tau,0, 2);

x_til_3_in=exp(-z_3*w_3*(t-tau))*sin(w_d3*(t-tau));
x_til_3_f=50*u_n(3,3)/w_d3*int(x_til_3_in,tau,0, t);
x_til_3_b=50*u_n(3,3)/w_d3*int(x_til_3_in,tau,0, 2);

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
% vpa(x_til_n_b,5)

t=0:0.001:5;
hold on
figure(5)
plot(t,subs(x_n1),'k-')
title('x_{N1}(t)��ʱ������ͼ��')
set(gca,'FontSize',20)
xlabel('t');ylabel('x_{N1}(t)')
figure(6)
plot(t,subs(x_n2),'k-')
title('x_{N2}(t)��ʱ������ͼ��')
set(gca,'FontSize',20)
xlabel('t');ylabel('x_{N2}(t)')
figure(7)
plot(t,subs(x_n3),'k-')
title('x_{N3}(t)��ʱ������ͼ��')
set(gca,'FontSize',20)
xlabel('t');ylabel('x_{N3}(t)')

figure(8)
plot(t,subs(x_1),'k-','LineWidth',1.5)
title('x_{1}(t)��ʱ������ͼ��')
set(gca,'FontSize',20)
xlabel('t');ylabel('x_{1}(t)')
figure(9)
plot(t,subs(x_2),'k-','LineWidth',1.5)
title('x_{2}(t)��ʱ������ͼ��')
set(gca,'FontSize',20)
xlabel('t');ylabel('x_{2}(t)')
figure(10)
plot(t,subs(x_3),'k-','LineWidth',1.5)
title('x_{3}(t)��ʱ������ͼ��')
set(gca,'FontSize',20)
xlabel('t');ylabel('x_{3}(t)')
hold off

%���λ�������ͼ��������
figure(11)
subplot(1,2,1)      %����һ
t=0:0.01:5;
plot(t,subs(x_1))
title('ϵͳԭʼ����x_{1}��0~5s��Ӧ')
xlabel('t/s')
ylabel('x_{1}/m')
subplot(1,2,2)          %�Ѿֲ��Ŵ�������
t=0:0.001:1;
plot(t,subs(x_1))
title('ϵͳԭʼ����x_{1}��0~1s��Ӧ')
xlabel('t/s')
ylabel('x_{1}/m')
hold on
% 
figure(12)
subplot(1,2,1)      %�����
t=0:0.01:5;
plot(t,subs(x_2))
title('ϵͳԭʼ����x_{2}��0~5s��Ӧ')
xlabel('t/s')
ylabel('x_{2}/m')
subplot(1,2,2)          %�Ѿֲ��Ŵ�������
t=0:0.001:1;
plot(t,subs(x_2))
title('ϵͳԭʼ����x_{2}��0~1s��Ӧ')
xlabel('t/s')
ylabel('x_{2}/m')
hold on
figure(13)
subplot(1,2,1)      %������
t=0:0.01:5;
plot(t,subs(x_3))
title('ϵͳԭʼ����x_{3}��0~5s��Ӧ')
xlabel('t/s')
ylabel('x_{3}/m')
subplot(1,2,2)          %�Ѿֲ��Ŵ�������
t=0:0.001:1;
plot(t,subs(x_3))
title('ϵͳԭʼ����x_{3}��0~1s��Ӧ')
xlabel('t/s')
ylabel('x_{3}/m')
hold on

figure(14)%%%                          ����������xN1ͼ
t=0:0.001:5;
plot(t,subs(x_n1),'-r')       %��ʼ�����µ���
hold on
t=0:0.001:2;                %�����µ�0-2����Ӧ
plot(t,subs(x_til_1_f),'-.b');
hold on
t=2:0.001:5;              %�����µ�2-5����Ӧ
plot(t,subs(x_til_1_b),'-.b');
xlabel('t/s')
ylabel('x/m')
legend('��ʼ����','��������')
title("��ʼ�����ͼ����µ���Ӧ")

figure(15)      %����������Ӧ�ĵ���
t=0:0.001:2;           
plot(t,subs(x_til_1_f+x_n1),'b');
hold on
t=2:0.001:5;
plot(t,subs(x_til_1_b+x_n1),'b');
xlabel('t/s')
ylabel('x/m')
title("����Ӧ����")
hold on

figure(16)%%%                             ����������xN2ͼ
t=0:0.001:5;
plot(t,subs(x_n2),'-r')       %��ʼ�����µ���
hold on
t=0:0.001:2;                %������0-2������Ӧ
plot(t,subs(x_til_2_f),'-.b');
hold on
t=0:0.001:5;                    %������2-5������Ӧ
plot(t,subs(x_til_2_b),'-.b');
xlabel('t/s')
ylabel('x/m')
legend('��ʼ����','��������')
title("��ʼ�����ͼ����µ���Ӧ")
figure(17)              %�ֲ��Ŵ�ͼ
subplot(1,2,1)
t=0:0.001:0.2;
plot(t,subs(x_n2),'-.r')
hold on
plot(t,subs(x_til_2_f),'-b')
hold on
legend('��ʼ����','��������')
title("��ʼ�����ͼ����µ���Ӧ")
subplot(1,2,2)                 
t=2:0.001:2.2;
plot(t,subs(x_n2),'-.r')
hold on
plot(t,subs(x_til_2_b),'-b')
hold on
xlabel('t/s')
ylabel('x/m')
legend('��ʼ����','��������')
title("��ʼ�����ͼ����µ���Ӧ")

figure(18)                           %����������Ӧ�ĵ���
t=0:0.001:2;           
plot(t,subs(x_til_2_f+x_n2),'b');
hold on
t=2:0.001:5;
plot(t,subs(x_til_2_b+x_n2),'b');
xlabel('t/s')
ylabel('x/m')
title("����Ӧ����")
hold on

figure(19)%%%                              ����������xN3ͼ
t=0:0.001:5;
plot(t,subs(x_n3),'-r')           %��ʼ�����µ���
hold on
t=0:0.001:2;                     %������0-2������Ӧ
plot(t,subs(x_til_3_f),'-.b');
hold on
t=2:0.001:5;                  %������2-5������Ӧ
plot(t,subs(x_til_3_b),'-.b');
xlabel('t/s')
ylabel('x/m')
legend('��ʼ����','��������')
title("��ʼ�����ͼ����µ���Ӧ")
figure(20)                   %�ֲ��Ŵ�ͼ
subplot(1,2,1)
t=0:0.001:0.2;
plot(t,subs(x_n3),'-.r')
hold on
plot(t,subs(x_til_3_f),'-b')
hold on
legend('��ʼ����','��������')
title("��ʼ�����ͼ����µ���Ӧ")
subplot(1,2,2)                 
t=2:0.001:2.2;
plot(t,subs(x_n3),'-.r')
hold on
plot(t,subs(x_til_3_b),'-b')
hold on
xlabel('t/s')
ylabel('x/m')
legend('��ʼ����','��������')
title("��ʼ�����ͼ����µ���Ӧ")

figure(21)                    %����������Ӧ�ĵ���
t=0:0.001:2;           
plot(t,subs(x_til_3_f+x_n3),'b');
hold on
t=2:0.001:5;
plot(t,subs(x_til_3_b+x_n3),'b');
xlabel('t/s')
ylabel('x/m')
title("����Ӧ����")
hold on

figure(22)
t=0:0.001:5;
plot(t,subs(x_1),'-r')       %��ʼ�����µ���
hold on
t=0:0.001:2;                %�����µ�0-2����Ӧ
plot(t,subs(x1_til_f),'-.b')
hold on
t=2:0.001:5;              %�����µ�2-5����Ӧ
plot(t,subs(x1_til_b),'-.b')
xlabel('t/s')
ylabel('x/m')
legend('��ʼ����','��������')
title("��ʼ�����ͼ����µ���Ӧ")

figure(23)      %����������Ӧ�ĵ���
t=0:0.001:2;           
plot(t,subs(x1_til_f+x_1),'b');
hold on
t=2:0.001:5;
plot(t,subs(x1_til_b+x_1),'b');
xlabel('t/s')
ylabel('x/m')
title("����Ӧ����")
hold on

figure(24)
t=0:0.001:5;
plot(t,subs(x_2),'-r')       %��ʼ�����µ���
hold on
t=0:0.001:2;                %�����µ�0-2����Ӧ
plot(t,subs(x2_til_f),'-.b')
hold on
t=2:0.001:5;              %�����µ�2-5����Ӧ
plot(t,subs(x2_til_b),'-.b')
xlabel('t/s')
ylabel('x/m')
legend('��ʼ����','��������')
title("��ʼ�����ͼ����µ���Ӧ")

figure(25)      %����������Ӧ�ĵ���
t=0:0.001:2;           
plot(t,subs(x2_til_f+x_2),'b');
hold on
t=2:0.001:5;
plot(t,subs(x2_til_b+x_2),'b');
xlabel('t/s')
ylabel('x/m')
title("����Ӧ����")
hold on

figure(26)
t=0:0.001:5;
plot(t,subs(x_3),'-r')       %��ʼ�����µ���
hold on
t=0:0.001:2;                %�����µ�0-2����Ӧ
plot(t,subs(x3_til_f),'-.b')
hold on
t=2:0.001:5;              %�����µ�2-5����Ӧ
plot(t,subs(x3_til_b),'-.b')
xlabel('t/s')
ylabel('x/m')
legend('��ʼ����','��������')
title("��ʼ�����ͼ����µ���Ӧ")

figure(27)      %����������Ӧ�ĵ���
t=0:0.001:2;           
plot(t,subs(x3_til_f+x_3),'b');
hold on
t=2:0.001:5;
plot(t,subs(x3_til_b+x_3),'b');
xlabel('t/s')
ylabel('x/m')
title("����Ӧ����")
hold on
