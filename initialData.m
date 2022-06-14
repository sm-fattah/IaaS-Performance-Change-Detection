%clear;
%load('./Data/consumer_workloads.mat');
%QoS values are generated from QoSGenerator
%time and workload factor are considered have equal impact on all QoS
%paramters. The function getTP,getIR, and getRR applies the same workload
%and time factor for each QoS parameter.
%load('./Data/QoS.mat');

QoSGenerator
load('./Data/timeFactors');
total_provider = 5;
total_consumer = 18;
total_time = 360;
each_month = 30;
trial_period = 30;
total_month = 12;



con_tp = zeros(total_time,total_provider,total_consumer);

trial = false;
% for con=1:total_consumer
%     
%     for time = 1:total_time
%         
%         for prov = 1:total_provider
%             
%                         
%             con_tp(time,prov,con)=getTP(time,prov,con_work(time,con),tp,work,timeFactors,trial);
% 
% 
%         end
%     end
% end

for prov = 1:total_provider
    
    for con=1:total_consumer
        
        for time = 1:total_time
            
             con_tp(time,prov,con)=getTP(time,prov,con_work(time,con),tp,work,timeFactors,trial);
             
        end
    end
end


sig_tp = zeros(total_time,total_provider);


%generating QoS signatures:
for p =1:total_provider
    
    reshape_tp = reshape(con_tp(:,p,:),[total_time, total_consumer]);
    sig_tp(:,p) = normalize(mean(reshape_tp,2),'range');
    
end

original_signature = sig_tp;



%checking the similarity for each month

min_similarity_score = ones(total_month, total_provider);
min_similarity_consumer = zeros(total_month,total_provider);

for month = 1:12
    
    for prov=1:total_provider
        
        for con=1:total_consumer
            
            start_day = (month-1)*each_month+1;
            end_day = start_day-1 + trial_period;
            
            trial_exp = con_tp(start_day:end_day,prov,con);
            %trial_exp = normalize(trial_exp,'scale');
            score = corrcoef(trial_exp,original_signature(start_day:end_day,prov));
            
            if(score(1,2) < min_similarity_score(month,prov))
                min_similarity_score(month,prov) = score(1,2);
                min_similarity_consumer(month,prov) = con;
            end
            
            
            
        end
    end
end 

%checking the total_similarity of each consumer

total_similarity = zeros(total_consumer,total_provider);
for prov=1:total_provider
    for con = 1:total_consumer
        trial_exp = normalize(con_tp(:,prov,con),'range');
        score = corrcoef(original_signature(:,prov),trial_exp);
        total_similarity(con,prov) = score(1,2);
    end
end


set(0,'DefaultFigureWindowStyle','docked')
% figure;
% plot(actual_work);
% for prov = 1:total_provider
%     figure;
%     plot(sig_tp(:,prov));
%     hold on;
%     plot(timeFactors(:,prov));
%     %break;
% end
% 
% for con=1:8
%     figure;
%     plot(con_tp(:,1,con));
%     hold on;
% end
set(0,'DefaultFigureWindowStyle','normal')
