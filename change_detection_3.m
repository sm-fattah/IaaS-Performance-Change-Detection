% detect changes based on CUSUM



detection_results = zeros(total_signatures,total_provider);


%computing similarity results
for i=1:total_signatures
    for p = 1:total_provider
        
                target_mean = mean(original_signature(change_st:change_en,p));
                target_std = std(original_signature(change_st:change_en,p));
                climit = 5;
                mshift = 1;
        [iupper, ilower]=cusum(change_signatures(change_st:change_en,p,i),climit,mshift,target_mean,target_std);
        
        if(~isempty(iupper) || ~isempty(ilower))
            detection_results(i,p) = 1;
        end
    end
end


result3_TP = [result3_TP;sum(sum(detection_results))];

%computing similarity results
for i=1:total_signatures
    for p = 1:total_provider
        
                target_mean = mean(original_signature(change_st:change_en,p));
                target_std = std(original_signature(change_st:change_en,p));
                climit = 5;
                mshift = 1;
        [iupper, ilower]=cusum(noisy_signatures(change_st:change_en,p,i),climit,mshift,target_mean,target_std);
        
        if(~isempty(iupper) || ~isempty(ilower))
            detection_results(i,p) = 1;
        end
    end
end
result3_FP = [result3_FP;sum(sum(detection_results))];