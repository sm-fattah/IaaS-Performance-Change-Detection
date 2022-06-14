% mean(similarity_results_fp,3);
% mean(similarity_results_delay,3);
% 
% mean(similarity_results_min_delay,3);
% mean(similarity_results_max_delay,3);
% mean(similarity_results_percentile,3);

% 
% 
% mean(anomaly_results_fp,3);
% mean(anomaly_results_delay,3);

% mean(anomaly_results_min_delay,3);
% mean(anomaly_results_max_delay,3);

% mean(anomaly_results_percentile,3);

set(0,'DefaultFigureWindowStyle','docked')
% 
figure;
res = mean(similarity_results_fp,3);
x = .1:.1:.9;
plot(x,res(:,1),'k--',x,res(:,2),'r:.',x,res(:,3),'b-');

legend({'anomaly threshold=22.22%','anomaly threshold=33.34','anomaly threshold=44.44%'},'Location','northwest')

xlabel('Similarity thresholds') 
ylabel('No. of false positives')      

xlim([0.1 0.9])
xticks(0.1:0.1:0.9)
ylim([0 160])
yticks(0:20:160);

ax = gca;
%ax.YAxis.Exponent = 4;
ax.FontSize = 28;
% outerpos = ax.OuterPosition;
% ti = ax.TightInset; 
% left = outerpos(1) + ti(1);
% bottom = outerpos(2) + ti(2);
% ax_width = outerpos(3) - ti(1) - ti(3);
% ax_height = outerpos(4) - ti(2) - ti(4);
% ax.Position = [left bottom ax_width ax_height];  



figure;
res = mean(anomaly_results_fp,3);
x = 1:18;
per_x = (x/18)*100;
x = per_x;
plot(x,res(:,1),'k--',x,res(:,2),'r:.',x,res(:,3),'b-');
%         xlim([0 400])
xlim([10 100])
xticks(10:10:100);

ylim([0 280])
yticks(0:40:280);

legend({'similarity threshold=0.3','similarity threshold=0.5','similarity threshold=0.7'},'Location','northeast')

xlabel('Anomaly thresholds (%)') 
ylabel('No. of false positives')      

ax = gca;
%ax.YAxis.Exponent = 4;
ax.FontSize = 28;
% outerpos = ax.OuterPosition;
% ti = ax.TightInset; 
% left = outerpos(1) + ti(1);
% bottom = outerpos(2) + ti(2);
% ax_width = outerpos(3) - ti(1) - ti(3);
% ax_height = outerpos(4) - ti(2) - ti(4);
% ax.Position = [left bottom ax_width ax_height];  


figure;
res = mean(similarity_results_delay,3);
x = .1:.1:.9;
plot(x,res(:,1),'k--',x,res(:,2),'r:.',x,res(:,3),'b-');

legend({'anomaly threshold=22.22%','anomaly threshold=33.34','anomaly threshold=44.44%'},'Location','northeast')

xlabel('Similarity thresholds') 
ylabel('Average delay (days)')      
xlim([0.1 0.9])
xticks(0.1:0.1:0.9)

ylim([25 55])
yticks(25:10:55);

ax = gca;
%ax.YAxis.Exponent = 4;
ax.FontSize = 28;
% outerpos = ax.OuterPosition;
% ti = ax.TightInset; 
% left = outerpos(1) + ti(1);
% bottom = outerpos(2) + ti(2);
% ax_width = outerpos(3) - ti(1) - ti(3);
% ax_height = outerpos(4) - ti(2) - ti(4);
% ax.Position = [left bottom ax_width ax_height]; 

figure;
res = mean(anomaly_results_delay,3);
x = 1:18;
per_x = (x/18)*100;
x = per_x;
plot(x,res(:,1),'k--',x,res(:,2),'r:.',x,res(:,3),'b-');
xlim([10 100])
xticks(10:10:100)
ylim([20 200])

yticks(20:20:200);
legend({'similarity threshold=0.3','similarity threshold=0.5','similarity threshold=0.7'},'Location','northwest')

xlabel('Anomaly thresholds (%)') 
ylabel('Average delay (days)')      

ax = gca;
%ax.YAxis.Exponent = 4;
ax.FontSize = 28;
% outerpos = ax.OuterPosition;
% ti = ax.TightInset; 
% left = outerpos(1) + ti(1);
% bottom = outerpos(2) + ti(2);
% ax_width = outerpos(3) - ti(1) - ti(3);
% ax_height = outerpos(4) - ti(2) - ti(4);
% ax.Position = [left bottom ax_width ax_height];  

figure;
res = mean(similarity_results_min_delay,3);
x = .1:.1:.9;
plot(x,res(:,1),'k--',x,res(:,2),'r:.',x,res(:,3),'b-');

legend({'anomaly threshold=22.22%','anomaly threshold=33.34','anomaly threshold=44.44%'},'Location','northeast')

xlabel('Similarity thresholds') 
ylabel('Minimum delay (days)')      
xlim([0.1 0.9])
xticks(0.1:0.1:0.9)

ylim([13 20])
yticks(13:1:20)
ax = gca;
%ax.YAxis.Exponent = 4;
ax.FontSize = 28;
% outerpos = ax.OuterPosition;
% ti = ax.TightInset; 
% left = outerpos(1) + ti(1);
% bottom = outerpos(2) + ti(2);
% ax_width = outerpos(3) - ti(1) - ti(3);
% ax_height = outerpos(4) - ti(2) - ti(4);
% ax.Position = [left bottom ax_width ax_height]; 

figure;
res = mean(anomaly_results_min_delay,3);
x = 1:18;
per_x = (x/18)*100;
x = per_x;
plot(x,res(:,1),'k--',x,res(:,2),'r:.',x,res(:,3),'b-');
xlim([10 100])
xticks(10:10:100)

ylim([10 190])
yticks(10:20:190)
legend({'similarity threshold=0.3','similarity threshold=0.5','similarity threshold=0.7'},'Location','northwest')

xlabel('Anomaly thresholds (%)') 
ylabel('Minimnum delay (day)')      

ax = gca;
%ax.YAxis.Exponent = 4;
ax.FontSize = 28;
% outerpos = ax.OuterPosition;
% ti = ax.TightInset; 
% left = outerpos(1) + ti(1);
% bottom = outerpos(2) + ti(2);
% ax_width = outerpos(3) - ti(1) - ti(3);
% ax_height = outerpos(4) - ti(2) - ti(4);
% ax.Position = [left bottom ax_width ax_height];  

figure;
res = mean(similarity_results_percentile,3);
x = .1:.1:.9;
plot(x,res(:,1),'k--',x,res(:,2),'r:.',x,res(:,3),'b-');

legend({'anomaly threshold=22.22%','anomaly threshold=33.34','anomaly threshold=44.44%'},'Location','southeast')

xlabel('Similarity thresholds') 
ylabel('Detection accuracy')      
xlim([0.1 0.9])
xticks(0.1:0.1:0.9)
ax = gca;
%ax.YAxis.Exponent = 4;
ax.FontSize = 28;
% outerpos = ax.OuterPosition;
% ti = ax.TightInset; 
% left = outerpos(1) + ti(1);
% bottom = outerpos(2) + ti(2);
% ax_width = outerpos(3) - ti(1) - ti(3);
% ax_height = outerpos(4) - ti(2) - ti(4);
% ax.Position = [left bottom ax_width ax_height];  


figure;
res = mean(anomaly_results_percentile,3);
x = 1:18;
per_x = (x/18)*100;
x = per_x;
plot(x,res(:,1),'k--',x,res(:,2),'r:.',x,res(:,3),'b-');
%         xlim([0 400])
xlim([10 100])
xticks(10:10:100)

ylim([0 100])
yticks(0:20:100)
legend({'similarity threshold=0.3','similarity threshold=0.5','similarity threshold=0.8'},'Location','southwest')

xlabel('Anomaly thresholds (%)') 
ylabel('Detection accuracy')     

ax = gca;
%ax.YAxis.Exponent = 4;
ax.FontSize = 28;
% outerpos = ax.OuterPosition;
% ti = ax.TightInset; 
% left = outerpos(1) + ti(1);
% bottom = outerpos(2) + ti(2);
% ax_width = outerpos(3) - ti(1) - ti(3);
% ax_height = outerpos(4) - ti(2) - ti(4);
% ax.Position = [left bottom ax_width ax_height];  

% figure;
% res = mean(anomaly_results_percentile,3);
% plot(res);

set(0,'DefaultFigureWindowStyle','normal')