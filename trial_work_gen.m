function t_work = trial_work_gen(curr_method,work_info,trial_period,actual_work)
    if(curr_method == 1)
        f_sort = sortrows(work_info,2,'descend');
        t_work = f_sort(1:trial_period,1);
    elseif(curr_method == 2)
            f_sort = sortrows(work_info,1,'descend');
            t_work = f_sort(1:trial_period,1);
    elseif(curr_method == 3)
            f_sort = sortrows(work_info,2,'descend');
            t_work(1:(trial_period/2)) = f_sort(1:(trial_period/2),1);
            
            f_sort = sortrows(work_info,1,'descend');
            t_work((trial_period/2)+1:trial_period) = f_sort(1:(trial_period/2),1);
            %t_work(1:trial_period) = .1397;
            
%     elseif(curr_method == 4)
%         f_sort = sortrows(work_info,1,'descend');
%         t_work(1:trial_period) = f_sort(1,1);
%     end
end