%exp2_3 2020/11/7 zgz
rand('seed',1851960);
%init
a = randi(10,1,1);
b = randi([5 15],1,1);

%calculate sum
% y = exp(-0.5*t)*(t+pi/b);
s_rec = rec_sum(0,a*pi,b);%rec
s_tra = tra_sum(0,a*pi,b);%tra

%calculate loss
f = @(t) exp(-0.5*t).*(t+pi/b);
s = integral(f,0,a*pi);
loss_rec = abs(s-s_rec);
loss_tra = abs(s-s_tra);

