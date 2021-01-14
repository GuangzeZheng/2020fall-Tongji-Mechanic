
clear;
[x,y]=ode23('f2',[0,60.96],0.9);
y1=0*x+10.67;
plot(x,y,'linewidth',2)
hold on
plot(x,y1,'linewidth',2)
hold on
plot([60.96,60.96],ylim,'m--')
legend('ball','wall')
