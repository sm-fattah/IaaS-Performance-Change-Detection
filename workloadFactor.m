function wf = workloadFactor(w,p)
    workInfo=[1.3,1.0,1.5,0.99;
            1.15,1.8,0.9,0.70;
            1.30,1.2,0.99,0.80;
            1,1.6,0.98,0.80;
            0.5,1.5,0.85,0.95;];
        
%     if w>=0 && w<=8
%         wf = workInfo(p,1);
%     elseif  w>=9 && w<=16
%         wf = workInfo(p,2);
%     elseif  w>=17 && w<=24
%         wf = workInfo(p,3);
%     else
%         wf = workInfo(p,4);
%     end
        
    if w>0 && w<=.25
        wf = workInfo(p,1);
    elseif  w>.25 && w<=.5
        wf = workInfo(p,2);
    elseif  w>.5 && w<=.75
        wf = workInfo(p,3);
    else
        wf = workInfo(p,4);
    end
    %wf = wf*100;
end