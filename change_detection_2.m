detection_results = zeros(total_signatures,total_provider);

snr_values = zeros(total_signatures,total_provider);

for i=1:total_signatures
    for p = 1:total_provider
        
       
        noise = original_signature(change_st:change_en,p)-change_signatures(change_st:change_en,p,i);
        snr_values(i,p)= snr(original_signature(change_st:change_en,p),noise);
       
       
    end
end

for i=1:total_signatures
    for p = 1:total_provider
        
       if( snr_values(i,p) < snrs(1,p))       
            detection_results(i,p) = 1;
       end
%        if( snr_values(i,p) < snrs(3,p))       
%             detection_results(i,p) = 1;
%        end

    end
end

result2_TP = [result2_TP;sum(sum(detection_results))];

detection_results = zeros(total_signatures,total_provider);

snr_values = zeros(total_signatures,total_provider);

for i=1:total_signatures
    for p = 1:total_provider
        
       
        noise = original_signature(change_st:change_en,p)-noisy_signatures(change_st:change_en,p,i);
        snr_values(i,p)= snr(original_signature(change_st:change_en,p),noise);
       
       
    end
end

for i=1:total_signatures
    for p = 1:total_provider
        
       if( snr_values(i,p) < snrs(1,p))       
            detection_results(i,p) = 1;
       end
    end
end

result2_FP = [result2_FP;sum(sum(detection_results))];