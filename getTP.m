function result=getTP(time,provider,workload,tp,work,timeFactors,trial)

    if(workload==0)
        result = 0;
        return;
    end
    workFact = workloadFactor(workload,provider);
    %workFact = 1;%workloadFactor(workload,provider);
    [val,ind] = min(abs(work-workload));
    basePerf = mean(tp(ind));

    timeFact = timeFactors(time,provider);
    %result = timeFact*(workFact * tp(find(abs(work-workload)<0.0001)))+randi(500);
    %mul = 1000;
    %workFact = 100*workFact;
    
    %result = (basePerf+workFact) * (timeFact)+randi(100);
    
    result = (basePerf*workFact) + (timeFact*1000)+randi(50);
%     if(trial==true && provider==5)
%         result = (basePerf*workFact);
%     end

end