function [] = plot_est(value1,value2,value3,T,lambda)
n=length(value1);
hold on
for i=1:1:n
    plot([i,i],[0,abs(value2(i)-lambda)],'g','linewidth',0.5);
    plot([i,i],[0,abs(value1(i)-lambda)],'r','linewidth',0.5);
    plot([i,i],[0,abs(value3(i)-lambda)],'b','linewidth',0.5);
end
title('估计方法比较')
set(gca,'FontSize',28)
xlabel('n')
ylabel('Error')
set(gcf,'Position',get(0,'ScreenSize'))
saveas(gcf,['T=' num2str(T) '.png'])
close
end

