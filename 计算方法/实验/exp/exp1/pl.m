function Sn=pl(L,b1,b2)
%����������ȡi���Ⱦ�ڵ�ʱ��Ӧ��С������е�ֵSi�����Ƴ�ͼ��
%b1������߽磬b2�����ұ߽�
%L������һ�����飬Ҳ������һ������

 %��ֵ��ͼ
 n=length(L);
 for i=1:n
     s=L(i);
     L1=linspace(b1,b2,s+1);
     for j=2:s+1
             X(j-1)=(L1(j-1)+L1(j))/2; %Ѱ�����˵��е�ֵ
             Sn(j-1) = (((X(j-1)-L1(j))/(L1(j-1)-L1(j)))/(1+L1(j-1)^2))+(((X(j-1)-L1(j-1))/(L1(j)-L1(j-1)))/(1+L1(j)^2)) %�е�ֵ����ֵ
     end
     
%      plot(X,Sn);
%      legend('piecewise linear')
%      hold on
%      Z=Sn;
     %����f=1/(1+25*x^2)ͼ��
%      sym x;
%      h=ezplot(hs,[b1,b2]);
%      set(h,'color','r');%����ԭ����������ɫΪ��
%      grid on  %�������
%      bt=strcat('��i=',num2str(L(i)));% �ַ�������
%      title(bt);
     hold on
 end

