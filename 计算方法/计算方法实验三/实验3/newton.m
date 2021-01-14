function [iter_c,y] = newton(x0,f,f_diff,max_iter,error)
y = x0-f(x0)/f_diff(x0);
vpa(y,5);
iter_c = 1;

while abs(y-x0) >= error && iter_c < max_iter
    iter_c = iter_c+1;
    x0 = y;
    y  = vpa(x0-f(x0)/f_diff(x0),6);
end
end