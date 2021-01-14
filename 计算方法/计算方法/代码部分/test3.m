%实验三主函数，用于微分方程的求解

clear;
[x,y]=ode23('equation3_generate',[0,60.96],0.9);
y1=0*x+10.67;
plot(x,y,'linewidth',2)
hold on
plot(x,y1,'linewidth',2)
legend('球的轨迹','围墙的高度')
