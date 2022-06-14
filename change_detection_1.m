% detect changes based on time series similarities



% defining threshold for correlation coefficients
cf_th = .6;
rmse_th = .2;

sim_result = zeros(total_signatures,total_provider);
dis_result = zeros(total_signatures,total_provider);

detection_results = zeros(total_signatures,total_provider);


%computing similarity results
for i=1:total_signatures
    for p = 1:total_provider
        
       score = corrcoef(original_signature(change_st:change_en,p),change_signatures(change_st:change_en,p,i));
       dis = CalcPerf(original_signature(change_st:change_en,p),change_signatures(change_st:change_en,p,i));
       similarity = score(1,2);
       r_dis = dis.RMSE;
       
       sim_result(i,p) = similarity;
       dis_result(i,p) = dis.RMSE;
       
    end
end

%detecting change in changed signatures
for i=1:total_signatures
    for p = 1:total_provider
        if(sim_result(i,p)<cf_th && dis_result(i,p)>rmse_th)
            detection_results(i,p) = 1;
        elseif(sim_result(i,p)<cf_th && dis_result(i,p)<rmse_th)
           detection_results(i,p) = sliding_window(cf_th,original_signature(change_st:change_en,p),change_signatures(change_st:change_en,p,i));
        elseif(sim_result(i,p)>cf_th && dis_result(i,p)>rmse_th)
            
            %this will happen if there is attenuation
            flag = "pseodo attenuation";
          
        end
    end
end
result1_TP = [result1_TP;sum(sum(detection_results))];

sim_result = zeros(total_signatures,total_provider);
dis_result = zeros(total_signatures,total_provider);

detection_results = zeros(total_signatures,total_provider);

for i=1:total_signatures
    for p = 1:total_provider
        
       score = corrcoef(original_signature(change_st:change_en,p),noisy_signatures(change_st:change_en,p,i));
       dis = CalcPerf(original_signature(change_st:change_en,p),noisy_signatures(change_st:change_en,p,i));
       similarity = score(1,2);
       r_dis = dis.RMSE;
       
       sim_result(i,p) = similarity;
       dis_result(i,p) = dis.RMSE;
       
    end
end

for i=1:total_signatures
    for p = 1:total_provider
        if(sim_result(i,p)<cf_th && dis_result(i,p)>rmse_th)
            detection_results(i,p) = 1;
            
        elseif(sim_result(i,p)<cf_th && dis_result(i,p)<rmse_th)
           detection_results(i,p) = sliding_window(cf_th,original_signature(change_st:change_en,p),noisy_signatures(change_st:change_en,p,i));
        elseif(sim_result(i,p)>cf_th && dis_result(i,p)>rmse_th)
            
            
            flag = "pseodo attenuation";
            
        end
        
    end
end
result1_FP = [result1_FP;sum(sum(detection_results))];

