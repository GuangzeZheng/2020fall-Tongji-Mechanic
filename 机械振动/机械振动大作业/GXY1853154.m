%GXY1853154.main
syms  x1 x2 x3 x4 y1 y2 y3 y4 y x t;
c=3000;k=20000;m=1200;                   %����в���
N1=0;N2=5;N3=3;
w1=2*pi;w2=4*pi;w3=8*pi;
wn=sqrt(k/m);r=c/(2*sqrt(m*k));
r1=w1/wn;r2=w2/wn;r3=w3/wn;              %����Ƶ�ʱ�
y1(t)=k*N1*sin(w1*t)+c*N1*w1*cos(w1*t);    %�ֽ�Ϊ��������
y2(t)=k*N2*sin(w2*t+pi/2)+c*N2*w2*cos(w2*t+pi/2);
y3(t)=k*N3*sin(w3*t+pi/3)+c*N3*w3*cos(w3*t+pi/3);
x1(t)=wei(N1*k,k,r1,r)*sin(w1*t+xiang(r,r1))+wei(c*N1*w1,k,r1,r)*cos(w1*t+xiang(r,r1));%��ͬ�����µ���Ӧ����
x2(t)=wei(N2*k,k,r2,r)*sin(w2*t+pi/2+xiang(r,r2))+wei(c*N2*w2,k,r2,r)*cos(w2*t+pi/2+xiang(r,r2));
x3(t)=wei(N3*k,k,r3,r)*sin(w3*t+pi/3+xiang(r,r3))+wei(c*N3*w3,k,r3,r)*cos(w3*t+pi/3+xiang(r,r3));
y(t)=N1*sin(w1*t)+N2*sin(w2*t+pi/2)+N3*sin(w3*t+pi/3);           
x(t)=x1+x2+x3;                            %��Ӧ����
x4(t)=diff(x,2);                          %����ٶȵĺ���
y4(t)=diff(y,2);
t=0:0.01:2;
x4=x4(t);y4=y4(t);
y=y(t);x=x(t);

figure(1)                               %��Ӧ�뼤����ͼ��        
plot(t,y,'-',t,x,'--')
hold on
xlabel('t/s');
ylabel('x-y/10^{-3} m');
title('����y(t)����Ӧx(t)��ʱ������ͼ��');
legend('y(t)','x(t)')

figure(2)                             %��Ӧ���ٶ��뼤�����ٶȵ�ͼ��
plot(t,x4,'-',t,y4,'--')
title('��������Ӧ�ļ��ٶ�ͼ')
xlabel('t/s')
ylabel('���ٶ�/10^{-3}(m/s^2)')
legend('����','��Ӧ')

w=0:0.01:10*pi;                      %��Ƶ����Ƶ������ͼ��
p=k/m;
L= (sqrt((c.* w ).^2 + k^2)) ./...   %��Ƶ�������ߺ���
    (sqrt((k-m.*w.^2).^2 + (c .* w).^2));
figure(3)
plot(w,L)
grid on
hold on
title('��Ƶ��������')
xlabel('w/(rad/s)')
ylabel('|H_{y,x}(w)|')
     
n= -180+(atan((c*w)./k))*180/pi+90+... %����Ƶ��������
(((atan(c*w)./k)-(atan((c*w)./(k-m*(w.*w)))))*180/pi+90).*(w.*w<p)+...
    (((atan(c*w)./k)-(atan((c*w)./(k-m*(w.*w)))))*180/pi-90).*(w.*w>p);%��������ʽ��ʾ��Ƶ����
figure (4)
hold on
plot(w,n)
grid on
axis([0 10*pi -180 0]);
title('��Ƶ��������')
xlabel('w/(rad/s)')
ylabel('\theta /��^\circ��')

figure(5)                  %��ͬ������·�Ƶ�������ߺ���
hold on
for p=[0.2,0.3,0.4,r]
    b=0:0.01:5;
    n1= (sqrt((2*p.*b).^2 + 1)) ./...   
         (sqrt((1-b.^2).^2 + (2*p.* b).^2));
    plot(b,n1)
    grid on
    hold on
end
title('��Ƶ��������')
xlabel('Ƶ�ʱ�')
ylabel('|H_{y,x}(w)|')
legend('0.2','0.3','0.4','0.258')

figure(6)                    %ǰ����ٶȵĶԱ�
hold on
x6=respondacclerate(4900,75000,1200,N1,N2,N3);
plot(t,x4,'-',t,x6,'--')
grid on
title('k��c�ı�ǰ����Ӧ�ļ��ٶ�ͼ')
xlabel('t/s')
ylabel('���ٶ�/10^{-3}(m/s^2)')
legend('k��c��ǰ','k��c�ĺ�')

figure(7)
L1=respondfupin(4900,75000,1200);
plot(w,L,'-',w,L1,'--')
grid on
hold on
title('k��c�ı�ǰ����Ӧ�ķ�Ƶ��������')
xlabel('w/(rad/s)')
ylabel('|H_{y,x}(w)|')
legend('k��c��ǰ','k��c�ĺ�')

figure(8)                               %�ĺ���Ӧ���ǰ��ͼ��       
x5=respondzhuhan(4900,75000,1200,N1,N2,N3);
plot(t,x,'-',t,x5,'--')
hold on
xlabel('t/s');
ylabel('x-y/10^{-3} m');
title('k��cǰ����Ӧx(t)��ʱ������ͼ��');
legend('k��c��ǰ','k��c�ĺ�')







