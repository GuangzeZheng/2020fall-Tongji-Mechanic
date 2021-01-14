clear;
syms w;
c=35;
Z=[-3.208*w^2+1000+c*w*1i -1.791*w^2 ; -1.791*w^2 -3.208*w^2+1000+c*w*1i];
H=inv(Z);
Hf=(1000+c*w*1i)*H*[0.3125;0.6875];
Hf1=Hf(1);
Hf2=Hf(2);
Hfs=abs(Hf1+Hf2);
Fw=10*(1-cos(0.1*w))*Hfs;
Fww=subs(Fw,w,0:0.01:20*pi);
w=0:0.01:20*pi;
ns= 10*(1-cos(0.1*w)).*(sqrt(1000^2+ 25*w.^2 )) ./...
    (sqrt( (4.999*w.^2-1000).^2+(5*w).^2)) ;
plot(w,Fww,'linewidth',2)
hold on
plot(w,ns,'linewidth',2)
title('·ùÆµÆ×ÃÜ¶È·ùÖµÇúÏß')
legend('c=35 N?s/m','c=5 N?s/m');
xlabel('w/(rad/s)')
ylabel('|F(w)|')