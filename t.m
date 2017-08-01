%%% fix code here for ploting release times with same vector lengths and
%%% the scheduling of vcpus

clear; clc;
% hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fileID = fopen('D:\PENN\Summer_2017\RTDS scheduler\schedule_plot\repl_budget.txt');          %any file can be used except tickle
C = textscan(fileID,'%*s %u64 %*s %s %*s %*s %*s %*s %s %*s %*s %*s %*s %*s %*s %*s',50);
fclose(fileID);

time = C{1};
start_release = time(1);
delta = C{2};
vcpu = C{3};
% cpu;
nr_vcpu = 2;
for i = 1:length(delta)
    s1 = delta{i};
    s2 = vcpu{i};
    delta{i} = s1(1:end-1);   %uncommented
    vcpu{i} = s2(end-2:end-1);
    cpu{i} = s2(end-6:end-5);
%     v = sscanf(sprintf('%s ', vcpu{i}), '%d') +1;
%     if (nr_vcpu < v)    %??
%         nr_vcpu = v;
%     end
    time(i) = time(i) - start_release;
end


S = sprintf('%s ', cpu{:});
cpu = sscanf(S, '%d');
ms = double(time)/2903986;

% for i = 1:length(cpu)  %changed plotted values from vcpu to cpu
% %     hold on
%     color = getVcpuColor(cpu(i), nr_vcpu);
%     plot(ms(i),cpu(i),'Color',color,'Marker','^')
%     hold on
% %     stairs2(ms(i),vcpu(i),'^')
%             
% end
% stairs2(ms,vcpu,'^')
% axis([0 ms(length(ms)) -1 2])
ylim([-1 2])
ylabel('cpu#')



fileID1 = fopen('D:\PENN\Summer_2017\RTDS scheduler\MC_matlab-master\testDir\schedule_copy.txt');
C1 = textscan(fileID1,'%*s %u64 %*s %s %*s %*s %*s %*s %s %*s %*s %s %*s %*s %s %*s',10);
fclose(fileID1);
time1 = C1{1};
start_release1 = time1(1);
vcpu1 = C1{3};
for i = 1:length(vcpu1)  
    s21 = vcpu1{i};
    vcpu1{i} = s21(end-2:end-1);
    cpu1{i} = s21(end-6:end-5);
    time1(i) = time1(i)-start_release1;
end
  
S1 = sprintf('%s ', cpu1{:});
cpu1 = sscanf(S1, '%d');
ms1 = double(time1)/2903986;

close all;

fig = figure
% plot(ms,vcpu)
for i = 1:length(cpu)  %changed plotted values from vcpu to cpu
%     hold on
    color = getVcpuColor(cpu(i), nr_vcpu);
    plot(ms(i),cpu(i),'Color',color,'Marker','^')
    hold on
%     stairs2(ms(i),vcpu(i),'^')
            
end
% stairs2(ms1,cpu1)
x=ms1;
y= cpu1;
hold on;
fig2 = figure 
    for i=1:length(x)-1
        %plot(x(i:i+1),[y(i) y(i)],'LineWidth',2)
        plot(x(i:i+1),[y(i) y(i)],'Marker', '<');

        hold on;
    end
% hold off
ylim([-1 2])
