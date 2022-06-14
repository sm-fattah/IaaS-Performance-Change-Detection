
snrs = zeros(12,total_provider);

for p=1:total_provider
   for i=1:total_signatures
       
           noise = original_signature(change_st:change_en,p) - noisy_signatures(change_st:change_en,p,i);
           snrs(i,p)=snr(original_signature(change_st:change_en,p),noise);
        
%        for m = 1:12
%             
%            st = (m-1)*30+1;
%            en = st+29;
%            noise = original_signature(st:en,p) - noisy_signatures(st:en,p,i);
%            snrs(m,p)=snr(original_signature(st:en,p),noise);
%        end    
%    
%        break;
   end
end

test_noise =  noisy_signatures(:,p,1) - original_signature(:,p);

snr(original_signature(:,p), test_noise)