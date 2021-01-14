function yy=Polyfit_Valve(x,y,n)
%%
%功能：本程序为多项式拟合，输出多项式表达式并求值
%说明：x,y为插值节点和节点上的函数值，n是多项式最高项次数，xx是所求函数值的x值
%说明：x,y,xx都可以是向量，n是数字
%实例：在命令行键入：Polyfit_Valve([-2,0,2],[0,4,0],2,[1,2,3]) 
%      输出如下：fx=-1.000000*x^2 +4.000000*x^0
%               ans =

%                   -1.7500    0.0000    4.1786
%Edited by qjx,2018.04.01
%%
c=zeros(1,n+1);  %储存多项式系数
b='x^';
c=polyfit(x,y,n);
poly2sym(c);    %可以将数组C中的系数转化为多项式
fprintf('\nfx='); %打印多项式
for i=1:(n+1)
    if c(i)>0
        fprintf('+%f*%s%d',c(i),b,n+1-i);
    else if c(i)<0
        fprintf('%f*%s%d',c(i),b,n+1-i);
        else if c(i)==0
           fprintf(' ');
            end
        end
    end
end
fprintf('\n');
end