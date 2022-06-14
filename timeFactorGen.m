%https://alexpucher.com/blog/2015/07/13/visualizing-cloud-traces/

clear;

load('./Data/DS5trace.mat');
data = DS5trace;

sum = 0;
prevTime = 0;
len = size(data,1);
count = 0;
total_timestamps =size(unique(data(:,2)),1)-1;
result = zeros(total_timestamps,2);
resultIndex=1;
Nodes = [];
nodeNames = unique(data(:,4));
total_nodes = size(nodeNames,1)-1;
%Nodes = zeros(total_nodes,2);
Nodes(:,1) = nodeNames(2:total_nodes+1,1);
Nodes(:,2) = zeros(total_nodes,1);

for i = 1:len
    
    flag = data(i,1);
    currentTime=str2double(data(i,2));
    taskID = data(i,3);
    nodeName=data(i,4);    
    coreCount=str2double(data(i,5));
      
    
    if(currentTime>prevTime)       
        %create a new point on horizon
        result(resultIndex,:) = [prevTime sum];
        resultIndex=resultIndex+1;
    end
    if(flag=="START")
        sum=sum+coreCount;
        
    else
        startStop=find(strcmp(data(:,3), taskID));
        sum=sum - str2double( data(startStop(1),5));
       
        
    end
    prevTime = currentTime;
end
%result = normalize(result,'range');
%result = downsample(result,18);
%result = normalize(result,'range');
%figure
%plot(result(:, 1),result(:, 2))
timeFactors = result(1:360*31,2);
timeFactors = reshape(timeFactors,[360,31]);

selects = [2 10 22 26 27];
timeFactors = timeFactors(:,selects);
timeFactors = normalize(timeFactors,'range');
%timeFactors = ceil(3*timeFactors);
plot(timeFactors);

