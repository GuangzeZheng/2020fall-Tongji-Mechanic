clear;
syms w;
result=zeros(60,1);
for c=1:60
    Z=[-3.208*w^2+1000+c*w*1i -1.791*w^2 ; -1.791*w^2 -3.208*w^2+1000+c*w*1i];
    H=inv(Z);
    Hf=(1000+c*w*1i)*H*[0.3125;0.6875];
    Hf1=Hf(1);
    Hf2=Hf(2);
    Hfs=abs(Hf1+Hf2);
    Fw=10*(1-cos(0.1*w))*Hfs;
    result(c)=int(Fw,w,[0,20*pi])
end
[minmin,index]=min(result)
result(c)=int(Fw,w,[0,20*pi])