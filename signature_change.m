% this program changes the existing signature
% which means changing the timeFactors of each signature

%change = randi([121,150]);

rng('default');
rng(3);

change_index = 0;

%changing signature 1
newTimeFactors = timeFactors;

fp_results = [];
delay_results = [];
min_delay_results = [];
max_delay_results = [];
count_results = [];

fp_for_similarity = [];
delay_for_similarity = [];
min_delay_for_similarity = [];
max_delay_for_similarity = [];
percentile_accuracy_similarity = [];


fp_for_anomaly = [];
delay_for_anomaly = [];
min_delay_for_anomaly = [];
max_delay_for_anomaly = [];
percentile_accuracy_anomaly= [];


total_simulation = 100;
    
similarity_results_fp = zeros(9,3,total_simulation);
similarity_results_delay = zeros(9,3,total_simulation);
similarity_results_min_delay = zeros(9,3,total_simulation);
similarity_results_max_delay = zeros(9,3,total_simulation);
similarity_results_percentile = zeros(9,3,total_simulation);


anomaly_results_fp = zeros(18,3,total_simulation);
anomaly_results_delay = zeros(18,3,total_simulation);
anomaly_results_min_delay = zeros(18,3,total_simulation);
anomaly_results_max_delay = zeros(18,3,total_simulation);
anomaly_results_percentile = zeros(18,3,total_simulation);


for num = 1:total_simulation
    

    change_index = randi([90,300]);
    
    %change_index = 29;
    
%     for p =1:total_provider-1
%         newTimeFactors(change_index:360,p+1) = timeFactors(change_index:360,p);
%     end
%     newTimeFactors(change_index:360,1) = timeFactors(change_index:360,2);

    for p = 1:total_provider
        x = movmean(timeFactors(:,p),10);
        newTimeFactors(change_index:360,p) = x(change_index:360,1);
    end
    disp(change_index)
    dataReGen
    

    fp_for_similarity = [];
    delay_for_similarity = [];
    min_delay_for_similarity = [];
    max_delay_for_similarity = [];
    percentile_accuracy_similarity = [];
    
    for sim_thresh = 0.1:0.1:0.9
         
        fp_results = [];
        delay_results = [];
        min_delay_results = [];
        max_delay_results = [];
        count_results = [];
        
        similarity_threshold = sim_thresh;
        for anom=4:2:8
            anomaly_threshold = anom;
            eventDetection    
        end
        fp_for_similarity = [fp_for_similarity; fp_results];
        delay_for_similarity = [delay_for_similarity; delay_results];
        min_delay_for_similarity = [min_delay_for_similarity;min_delay_results ];
        max_delay_for_similarity = [max_delay_for_similarity;max_delay_results ];
        percentile_accuracy_similarity = [percentile_accuracy_similarity; count_results];
    end
    

    similarity_results_fp(:,:,num) =  fp_for_similarity;
    similarity_results_delay(:,:,num)= delay_for_similarity;
    similarity_results_min_delay(:,:,num) = min_delay_for_similarity;
    similarity_results_max_delay(:,:,num) = max_delay_for_similarity;
    similarity_results_percentile(:,:,num) = percentile_accuracy_similarity;
    
    
    fp_for_anomaly = [];
    delay_for_anomaly = [];
    min_delay_for_anomaly = [];
    max_delay_for_anomaly = [];
    percentile_accuracy_anomaly = [];
    
    for anom_thresh = 1:18
        
        fp_results = [];
        delay_results = [];     
        min_delay_results = [];
        max_delay_results = [];
        count_results = [];
        
        anomaly_threshold = anom_thresh;
        
        for sim=.3:.2:.7
            similarity_threshold = sim;
            eventDetection
        end
        fp_for_anomaly = [fp_for_anomaly ; fp_results];
        delay_for_anomaly = [delay_for_anomaly ; delay_results];
        
        min_delay_for_anomaly = [min_delay_for_anomaly; min_delay_results];
        max_delay_for_anomaly = [max_delay_for_anomaly; max_delay_results];
        percentile_accuracy_anomaly = [percentile_accuracy_anomaly; count_results];
        
    end    
    
    anomaly_results_fp(:,:,num) = fp_for_anomaly;
    anomaly_results_delay(:,:,num) = delay_for_anomaly;
    anomaly_results_min_delay(:,:,num) = min_delay_for_anomaly;
    anomaly_results_max_delay(:,:,num) = max_delay_for_anomaly;
    anomaly_results_percentile(:,:,num) = percentile_accuracy_anomaly;
    
end


mean(similarity_results_fp,3)
mean(similarity_results_delay,3)

mean(similarity_results_min_delay,3)
mean(similarity_results_max_delay,3)


mean(anomaly_results_fp,3)
mean(anomaly_results_delay,3)
mean(anomaly_results_min_delay,3)
mean(anomaly_results_max_delay,3)
% mean(fp_for_similarity,2)
% mean(delay_for_similarity,2)
% 
% mean(fp_for_anomaly,2)
% mean(delay_for_anomaly,2)



% set(0,'DefaultFigureWindowStyle','docked')
% 
% 
% %ploting the old time factor
% 
% for p =1:total_provider
%     figure;
%     plot(timeFactors(change_index:360,p),'-');
%     hold on;
%     plot(newTimeFactors(change_index:360,p),'-.');
%     
% end
%     
% 
% % figure;
% % plot(timeFactors(:,1),'-');
% % hold on;
% % plot(newTimeFactors(:,1),'.');
% % timeFactors = newTimeFactors;
% 
% set(0,'DefaultFigureWindowStyle','normal')
