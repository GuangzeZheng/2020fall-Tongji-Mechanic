function tra_sum = tra_sum(floor,ceiling,b)
%梯形法求定积分

%init
s = 0;
i = 1;
w = 0.01; %梯形的宽度为0.01
n = (ceiling-floor)/w; %份数
t = floor;
y1 = exp(-0.5*t).*(t+pi/b);
y2 = exp(-0.5*(t+w)).*((t+w)+pi/b);

while i < n
    s = s+w*(y1+y2)/2;
    t = t+w;
    y1 = y2;
    y2 = exp(-0.5*(t+w)).*((t+w)+pi/b);
    i = i+1;
end

tra_sum = s;

end



