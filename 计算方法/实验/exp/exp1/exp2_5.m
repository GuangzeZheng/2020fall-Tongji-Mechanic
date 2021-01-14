%exp2_5 2020/11/7 zgz
rand('seed',1851960);
%init
x = [0.46,1.38,2.40,3.41,4.42,5.44,6.45,7.47,8.45,11.49,12.49,13.42,14.43,15.44,16.37,17.38,18.48,19.50,20.40,23.42,24.43,25.45]';
y = 8+12*rand(22,1);
a = polyfit(x,y,20);
z = polyval(a,x);
syms t

%cal int 
s = 0;
for i = 1:21
   s = s+int(a(1,i)*t^(21-i),t,0,24); 
end
s = vpa(s,5);

scatter(x, y);
hold on;
plot(x, z);
hold on;





