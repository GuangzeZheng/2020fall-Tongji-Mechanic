%respondfupin.m
function L1=respondfupin(c,k,m)
w=0:0.01:10*pi; 
L1= (sqrt((c.* w ).^2 + k^2)) ./...   %幅频特性曲线函数
    (sqrt((k-m.*w.^2).^2 + (c .* w).^2));