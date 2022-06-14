%this file regenarates the data after signature change

con_tp = zeros(total_time,total_provider,total_consumer);
% con_ir = con_tp;
% con_rr = con_ir;
trial = false;
for con=1:total_consumer
    
    for time = 1:total_time
        
        for prov = 1:total_provider
            
            
%             con_tp(time,prov,con)=getTP(time,prov,con_work(time,con),tp,work);
%             con_ir(time,prov,con)=getIR(time,prov,con_work(time,con),ir,work);
%             con_rr(time,prov,con)=getRR(time,prov,con_work(time,con),rr,work);
            
            con_tp(time,prov,con)=getTP(time,prov,con_work(time,con),tp,work,newTimeFactors,trial);


        end
    end
end