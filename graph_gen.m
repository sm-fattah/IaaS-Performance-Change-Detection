
set(0,'DefaultFigureWindowStyle','docked')

size = 6;

x = 50*5*2:50*5*2:50*5*2*size;
%x=x';
figure;
b=bar(x,fp_rate(1:size,:),'FaceColor','flat');
b(1).CData = [.5 .5 .5];

b(2).CData = [1 1 1];

b(3).CData = [0 0 0];


xlabel('Number of signatures');
ylabel('False positive rate');
legend({'Sliding Window','SNR-based','CUSUM'});
ylim([0,1.5])
yticks(0:.2:1.5)

ax = gca;
ax.FontSize = 16;
outerpos = ax.OuterPosition;
ti = ax.TightInset; 
left = outerpos(1) + ti(1);
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3);
ax_height = outerpos(4) - ti(2) - ti(4);
ax.Position = [left bottom ax_width ax_height];   





figure;
b1=bar(x,recall(1:size,:),'FaceColor','flat');
xlabel('Number of signatures');
ylabel('True positive rate');
legend({'Sliding Window','SNR-based','CUSUM'});
ylim([0,1.5])
yticks(0:.2:1.5)
b1(1).CData = [.5 .5 .5];

b1(2).CData = [1 1 1];

b1(3).CData = [0 0 0];

ax = gca;
ax.FontSize = 16;
outerpos = ax.OuterPosition;
ti = ax.TightInset; 
left = outerpos(1) + ti(1);
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3);
ax_height = outerpos(4) - ti(2) - ti(4);
ax.Position = [left bottom ax_width ax_height];   

figure;
b2=bar(x,accuracy(1:size,:),'FaceColor','flat');
xlabel('Number of signatures');
ylabel('Accuracy');
legend({'Sliding Window','SNR-based','CUSUM'});
ylim([0,1.5])
yticks(0:.2:1.5)
b2(1).CData = [.5 .5 .5];

b2(2).CData = [1 1 1];

b2(3).CData = [0 0 0];

ax = gca;
ax.FontSize = 16;
outerpos = ax.OuterPosition;
ti = ax.TightInset; 
left = outerpos(1) + ti(1);
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3);
ax_height = outerpos(4) - ti(2) - ti(4);
ax.Position = [left bottom ax_width ax_height];   

figure;
b3=bar(x,f1(1:size,:),'FaceColor','flat');
xlabel('Number of signatures');
ylabel('F1 Score');
legend({'Sliding Window','SNR-based','CUSUM'});
ylim([0,1.5])
yticks(0:.2:1.5)
b3(1).CData = [.5 .5 .5];

b3(2).CData = [1 1 1];

b3(3).CData = [0 0 0];

ax = gca;
ax.FontSize = 16;
outerpos = ax.OuterPosition;
ti = ax.TightInset; 
left = outerpos(1) + ti(1);
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3);
ax_height = outerpos(4) - ti(2) - ti(4);
ax.Position = [left bottom ax_width ax_height];   

% figure;
% plot(fp_rate);
% 
% figure;
% plot(recall);

set(0,'DefaultFigureWindowStyle','normal')