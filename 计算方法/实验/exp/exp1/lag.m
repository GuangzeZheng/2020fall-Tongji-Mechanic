%%%% ���������ն���ʽ��������  %%%%
%%%%                Liu Deping                %%%%
%%%%              2020.06.14                 %%%%
%�������:n+1���ڵ�(x_i,y_i)(i = 1,2, ... , n+1)����������X������������Y
%���������n���������ղ�ֵ����ʽL�ͻ�����l
X=input('���������������X:\nX=');  %���������Ϊһά���飬���磺[1,3,4,5]����ͬ����
Y=input('����������������Y:\nY=');
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
fprintf('������Ϊ��\n');
for k=1:m
    fprintf('q%d(x)=%s\n',k,l(k));
end
L = Y * l;
fprintf('�������ն���ʽΪ:\nP(x)=%s\n',L);