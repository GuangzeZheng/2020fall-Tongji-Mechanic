function rec_sum = rec_sum(floor,ceiling,b)
%���η��󶨻���

%init
s = 0;
i = 1;
w = 0.01; %���εĿ��Ϊ0.01
n = (ceiling-floor)/w; %����
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



