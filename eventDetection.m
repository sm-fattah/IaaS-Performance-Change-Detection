% read the con_tp file and checks for anomalies and events
trial_period = 30;
each_month = 30;
total_month = 12;

% change_index = 287;
% % 
% similarity_threshold = .9;
% anomaly_threshold = 4;
false_positives = 0;

anomalies_per_month = zeros(prov,total_month);
events_per_month = zeros(prov,total_month);


    
for prov = 1:total_provider
    
    for month = 1:total_month
        
        count_anomaly = 0;
        
        start_day = (month-1)*each_month+1;
        end_day = start_day-1 + trial_period;
        
        for con = 1:total_consumer


            trial_exp = con_tp(start_day:end_day,prov,con);

            %measure similarity

            score = corrcoef(trial_exp,original_signature(start_day:end_day,prov));
            
            if(score(1,2)<similarity_threshold)
            %if(score(1,2)<min_similarity_score(month,prov))
                count_anomaly = count_anomaly+1;
            end
            
        end
        anomalies_per_month(prov, month) = count_anomaly;
        events_per_month(prov, month) = floor(count_anomaly/anomaly_threshold);
        
        if(month<ceil(change_index/30))
            false_positives = false_positives+events_per_month(prov, month);
            
        end
        
    end

end
change_month = ceil(change_index/30);

detection_delay = zeros(total_provider,1);


    for p=1:total_provider
        for m=change_month:12
            if(events_per_month(p,m)~=0)
              
            
                %compute cusum
                %compute the signature
                start = (m-1)*30+1;
                reshape_tp = reshape(con_tp(start:start+29,p,:),[30, total_consumer]);
                new_signature = normalize(mean(reshape_tp,2),'range');
                target_mean = mean(original_signature(start:start+29,p));
                target_std = std(original_signature(start:start+29,p));
                climit = 5;
                mshift = 1;
                [iupper, ilower]=cusum(new_signature,climit,mshift,target_mean,target_std);
                
                if(isempty(iupper) && isempty(ilower))
                    detection_delay(p,1)=0;
                    false_positives = false_positives+events_per_month(p,m);
                    continue;
                elseif(~isempty(iupper) && ~isempty(ilower))
                    if(iupper<ilower)
                        detection_delay(p,1)=(m-1)*30+iupper-change_index;
                    else
                        detection_delay(p,1)=(m-1)*30+ilower-change_index;
                    end
                elseif(isempty(iupper))
                    detection_delay(p,1)=(m-1)*30+ilower-change_index;
                else
                    detection_delay(p,1)=(m-1)*30+iupper-change_index;
                end

                if(detection_delay(p,1)<0)
                    detection_delay(p,1)=0;
                    false_positives = false_positives+events_per_month(p,m);
                    continue;
                end
                break;
            end
        end
        
        if( detection_delay(p,1)==0)
             detection_delay(p,1) = total_time-change_index+1;
        end
       
        %break;
    end

fp_results = [fp_results,false_positives];
% false_positives
% detection_delay
delay_results = [delay_results,mean(detection_delay)];
min_delay_results = [min_delay_results, min(detection_delay)];
max_delay_results = [max_delay_results, max(detection_delay)];
count_results = [count_results, length(find(detection_delay<60))*20];

%mean(detection_delay)
