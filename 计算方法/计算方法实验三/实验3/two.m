function [iter,y]=two(x_upper,x_dowm,fun,error,iter_c)
x  = (x_upper+x_dowm)/2;
f3 = fun(x);
f1 = fun(x_upper);
if(f1*f3<0)
    m = x-x_upper;
    if(m>error)
        x_dowm = x;
        iter_c = iter_c+1;
        [iter_c,y] = two(x_upper,x_dowm,fun,error,iter_c);
    else
        y = x;
    end
else
    m = x_dowm-x;
    if(m > error)
        x_upper = x;
        iter_c = iter_c+1;
        [iter_c,y] = two(x_upper,x_dowm,fun,error,iter_c);
    else
        y = x;
    end
end
iter = iter_c;
end