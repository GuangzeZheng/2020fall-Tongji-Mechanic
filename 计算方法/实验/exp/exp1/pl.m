function Sn=pl(L,b1,b2)
%当在区间内取i个等距节点时对应的小区间的中点值Si并绘制出图形
%b1代表左边界，b2代表右边界
%L可以是一个数组，也可以是一个数字

 %插值绘图
 n=length(L);
 for i=1:n
     s=L(i);
     L1=linspace(b1,b2,s+1);
     for j=2:s+1
             X(j-1)=(L1(j-1)+L1(j))/2; %寻找两端点中点值
             Sn(j-1) = (((X(j-1)-L1(j))/(L1(j-1)-L1(j)))/(1+L1(j-1)^2))+(((X(j-1)-L1(j-1))/(L1(j)-L1(j-1)))/(1+L1(j)^2)) %中点值函数值
     end
     
%      plot(X,Sn);
%      legend('piecewise linear')
%      hold on
%      Z=Sn;
     %绘制f=1/(1+25*x^2)图形
%      sym x;
%      h=ezplot(hs,[b1,b2]);
%      set(h,'color','r');%设置原函数曲线颜色为红
%      grid on  %添加网格
%      bt=strcat('当i=',num2str(L(i)));% 字符串连接
%      title(bt);
     hold on
 end

