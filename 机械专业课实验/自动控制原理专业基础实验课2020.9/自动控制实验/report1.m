
plot(tout,y,'LineWidth',3);
xlabel('t/s');
ylabel('U/V');
title('二阶系统');
name='w=1.292';
legend(name);
saveas(gcf,'w=1.292.pdf');
figure('NumberTitle', 'of', 'Name', '二阶振荡系统频率特性图');

