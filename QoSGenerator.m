clear
load('./Data/ycsb.mat');
load('real_data.mat');
%load('./Data/consumer_workloads.mat');
load('./Data/con_work.mat');

rng('default');
rng(2);

total_points = 360;


uWorkloads = unique(con_work);
sortedWork = sort(uWorkloads,'descend');

number_of_workloads= size(sortedWork,1);

% con_work=consumer_workloads(:,1:total_points);
% con_work = con_work';

%QoS = str2double(ycsb(:,3:5));
QoS = str2double(ycsb(:,3));
TP=QoS(:,1);
% IR=QoS(:,2);
% RR=QoS(:,3);
sortedTP = sort(TP);
% sortedIR = sort(IR);
% sortedRR = sort(RR);
work = sortedWork;
% sortedWork = sort(con_work);
% figure
% plot(sortedTP);
% figure
% plot(sortedWork)


lenW = floor(size(QoS,1)./number_of_workloads);
tp = downsample(sortedTP,lenW);
% ir = downsample(sortedIR,lenW);
% rr = downsample(sortedRR,lenW);

tp=tp(1:number_of_workloads);

%new throughput generation randomly

% randTP = rand(number_of_workloads,1);
% sortedRandTP = sort(randTP);
% 
% tp = sortedRandTP;

%tp = normalize(tp,'range');
%tp = normalize(tp,'range');
% ir=ir(1:number_of_workloads);
% rr=rr(1:number_of_workloads);
%tp = normalize(tp,'range');
set(0,'DefaultFigureWindowStyle','docked')
% figure;
% 
% plot(work,tp);
%figure; plot(ir); figure; plot(rr);
set(0,'DefaultFigureWindowStyle','normal')
