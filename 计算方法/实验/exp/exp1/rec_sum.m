function rec_sum = rec_sum(floor,ceiling,b)
%矩形法求定积分

%init
s = 0;
i = 1;
w = 0.01; %矩形的宽度为0.01
n = (ceiling-floor)/w; %份数
t = floor;
y = exp(-0.5*t)*(t+pi/b);

while i < n
    s = s+w*y;
    t = t+w;
    y = exp(-0.5*t)*(t+pi/b);
    i = i+1;
end

rec_sum = s;

end



