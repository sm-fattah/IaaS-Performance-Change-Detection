function output = sliding_window(cf_th,ref,test)
%SLIDING_WINDOW Summary of this function goes here
%   Detailed explanation goes here
output = 1;
window_size = 5;



%s_init = corrcoef(ref,test);



for i = 1:30-window_size
    new_ref = ref;
    new_ref(i: i-1+window_size) = [];
    
    new_test = test;
    
    new_test(i: i-1+window_size) = [];
    
    s = corrcoef(new_ref,new_test);
    if(s(1,2)>.5)
        output = 0;
        return;
    end
end

