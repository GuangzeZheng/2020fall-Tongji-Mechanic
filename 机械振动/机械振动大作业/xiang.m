function x=xiang(d,r)
if r<1
   x=-atan(2*d*r/(1-r^2));
else
    x=-atan(2*d*r/(1-r^2))-pi;
end