function y=Flexible(x,a,l,EI)
b=l-a;
if (x<=a) && (x>=0)
    y=b*x/(6*EI*l)*(l^2-x^2-b^2);
elseif (x<=l) && (x>=a)
    y=b/(6*EI*l)*(x*(l^2-x^2-b^2)+l/b*(x-a)^3);
end

