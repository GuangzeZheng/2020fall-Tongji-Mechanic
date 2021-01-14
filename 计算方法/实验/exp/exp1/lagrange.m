function y=lagrange(x0,y0,x)
%此函数用于形成拉格朗日插值公式；

n = length(x0);
m = length(x);
y = zeros(1,m);
for i=1:m
   z=x(i);s=0;
   for k=1:n
      L=1;
      for j=1:n
         if j~=k
            L=L*(z-x0(j))/(x0(k)-x0(j));
         end
      end
      s=s+L*y0(k);
   end
   y(i)=s;
end

