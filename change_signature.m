%%% this file will change existing signatures. some signature will have
%%% noise and some signature will be altered.



% rng('default');
rng(1);
%total_signatures = 50;
change_signatures = zeros(360,5,total_signatures);
noisy_signatures = zeros(360,5,total_signatures);

%lets create noisy signatures first

change_st = 61;
change_en = change_st-1+30; %change index and noise index same


for i=1:total_signatures
    for p = 1:total_provider
        
        change_signatures(:,p,i) = original_signature(:,p);
        %x = movmean(original_signature(:,p),30);
        %change_signatures(:,p,i) = x(:,1);
        %random provider's signature
        r = randsample(5,1);
        while r==p
            r = randsample(5,1);
        end
        change_signatures(change_st:change_en,p,i) = original_signature(change_st:change_en,r);
    end
end

%plot(change_signatures(change_st:change_en,5,1),'r'); hold on; plot(original_signature(change_st:change_en,5,1),'b');
%corrcoef(change_signatures(:,5,1),original_signature(:,5,1))
corrcoef(change_signatures(change_st:change_en,5,1),original_signature(change_st:change_en,5,1));
%CalcPerf(change_signatures(change_st:change_en,5,1),original_signature(change_st:change_en,5,1))

spike_size = 3;

for i=1:total_signatures
    for p = 1:total_provider
        
        noisy_signatures(:,p,i) = original_signature(:,p);
        spike_index = randsample(27,1); % sampling 1 index from 27. 
        
        noisy_signatures(change_st-1+spike_index:change_st-1+spike_index+spike_size-1,p,i) = 0.001*(ones(spike_size,1));
    end
end
% figure;
% plot(noisy_signatures(change_st:change_en,5,1),'r'); hold on; plot(original_signature(change_st:change_en,5,1),'b');
%corrcoef(noisy_signatures(:,5,1),original_signature(:,5,1))
corrcoef(noisy_signatures(change_st:change_en,5,1),original_signature(change_st:change_en,5,1));
%CalcPerf(noisy_signatures(change_st:change_en,5,1),original_signature(change_st:change_en,5,1))




for i=1:total_signatures
    for p = 1:total_provider
        
        %noisy_signatures(:,p,i) = original_signature(:,p);
        %s_value = randsample(5,1)+10;
        noisy_signatures(:,p,i) = awgn(noisy_signatures(:,p,i),20);
    end
end


%figure;

%plot(noisy_signatures(change_st:change_en,5,1),'r'); hold on; plot(original_signature(change_st:change_en,5,1),'b');
%corrcoef(noisy_signatures(change_st:change_en,5,1),original_signature(change_st:change_en,5,1))
%CalcPerf(noisy_signatures(change_st:change_en,5,1),original_signature(change_st:change_en,5,1))
