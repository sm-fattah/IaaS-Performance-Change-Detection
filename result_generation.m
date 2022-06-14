total_signatures = 50;

initialData
total_num = 30; %total number of simulation
result1_TP = [];
result1_FP = [];

result2_TP = [];
result2_FP = [];

result3_TP = [];
result3_FP = [];

for k = 1:total_num
    total_signatures = 50*k;
    change_signature
    change_detection_1
    measure_snrs
    change_detection_2
    change_detection_3
    
    %break
    
end

results_TP = [result1_TP, result2_TP, result3_TP];
results_FP = [result1_FP, result2_FP, result3_FP];

fp_rate = zeros(total_num,3);
tp_rate = zeros(total_num,3);

precision = zeros(total_num,3);
recall = zeros(total_num,3);
accuracy = zeros(total_num,3);
f1 = zeros(total_num,3);
%for each iteration
for i=1:total_num
    for j =1:3 %total approaches
        
        tp = results_TP(i,j);
        fp = results_FP(i,j);
        fn = 250*i-results_TP(i,j);
        tn = 250*i - results_FP(i,j);
        
        accuracy(i,j) = (tp+tn)/(tp+tn+fp+fn);
        precision(i,j) = tp/(tp+fp);
        recall(i,j) = tp/(tp+fn);
        f1(i,j) = 2* precision(i,j)*recall(i,j) / (precision(i,j)+recall(i,j));

        fp_rate(i,j) = fp/(fp+tn);
        
        
    end
end
% figure;
% plot(accuracy)
% figure;
% plot(recall)
% figure;
% plot(precision)
% figure;
% plot(f1);
% 
% 
% figure;
% plot(results_FP);
% figure;
% plot(results_TP);

figure;
plot(fp_rate);
