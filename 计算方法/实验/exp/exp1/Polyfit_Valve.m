function yy=Polyfit_Valve(x,y,n)
%%
%���ܣ�������Ϊ����ʽ��ϣ��������ʽ���ʽ����ֵ
%˵����x,yΪ��ֵ�ڵ�ͽڵ��ϵĺ���ֵ��n�Ƕ���ʽ����������xx��������ֵ��xֵ
%˵����x,y,xx��������������n������
%ʵ�����������м��룺Polyfit_Valve([-2,0,2],[0,4,0],2,[1,2,3]) 
%      ������£�fx=-1.000000*x^2 +4.000000*x^0
%               ans =

%                   -1.7500    0.0000    4.1786
%Edited by qjx,2018.04.01
%%
c=zeros(1,n+1);  %�������ʽϵ��
b='x^';
c=polyfit(x,y,n);
poly2sym(c);    %���Խ�����C�е�ϵ��ת��Ϊ����ʽ
fprintf('\nfx='); %��ӡ����ʽ
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