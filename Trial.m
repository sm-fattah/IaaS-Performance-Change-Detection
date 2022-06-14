trial_period = 30;
total_season = 3;
each_month = 30;
trial_month=5;

start = 1+(trial_month-1)*each_month;
en = start-1+ trial_period;

disp(start)
disp(en)

act_consumer = 3;
actual_work = con_work(:,act_consumer);
actual_tp = con_tp(:,:,act_consumer);


[freq,u_work]=hist(actual_work,unique(actual_work));
work_info = [u_work,freq'];


%generating trial workload
%sample_rate = total_time/trial_period;

methods = 3;
trial_work = zeros(trial_period,methods);
trial_tp = zeros(trial_period, total_provider, methods);
trial = true;
for m = 1: methods
    
    trial_work(:,m) = trial_work_gen(m,work_info,trial_period,actual_work);    
    
    for t = 1:trial_period    
        
        for prov = 1:total_provider
            
            trial_tp(t,prov,m) = getTP(t+(trial_month-1)*each_month,prov,trial_work(t,m),tp,work,timeFactors,trial);
            
        end             
        
    end
end






