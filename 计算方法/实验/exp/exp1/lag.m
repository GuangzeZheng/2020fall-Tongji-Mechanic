%%%% 求拉格朗日多项式及基函数  %%%%
%%%%                Liu Deping                %%%%
%%%%              2020.06.14                 %%%%
%输入的量:n+1个节点(x_i,y_i)(i = 1,2, ... , n+1)横坐标向量X，纵坐标向量Y
%输出的量：n次拉格朗日插值多项式L和基函数l
X=input('请输入横坐标向量X:\nX=');  %输入的数据为一维数组，例如：[1,3,4,5]（下同）；
Y=input('请输入纵坐标向量Y:\nY=');
m = length(X);
L = ones(m,m);
for k = 1 : m
    V = 1;
    for i = 1 : m
        if k ~= i
            V = conv(V,poly(X(i))) / (X(k) - X(i));
        end
    end
    L1(k, :) = V; 
    l(k, :) = poly2sym(V);
end
fprintf('基函数为：\n');
for k=1:m
    fprintf('q%d(x)=%s\n',k,l(k));
end
L = Y * l;
fprintf('拉格朗日多项式为:\nP(x)=%s\n',L);