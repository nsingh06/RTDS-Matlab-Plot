%%% fresh attempt to plot vectors with same length
%%% currently not getting output with concurrent scheduling on pcpus
%%% one reason is initial data has scheduling on one pcpu only or the
%%% samples plotted do not capture for both

clear; clc;
% hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fileID = fopen('D:\PENN\Summer_2017\RTDS scheduler\schedule_plot\runq_pick_copy.txt');          %any file can be used except tickle
C = textscan(fileID,'CPU%s %u64 %*s %d) rtds:%s %*s %*s %*s %s %*s %*s %s %*s %*s %s %*s',50);
fclose(fileID);

pcpu = C{1};
time = C{2};
delta = C{3};
event = C{4};
vcpu = C{5};
dom = C{5};
% if strcmp('schedule',event{1})  %assumption that first entry is rtds:schedule
    start_release = time(1);
% end
% vcpu{1}= '00';
% dom{1} = '00';

y1=[]; y2=[]; y3=[]; y4=[]; y5=[]; y6=[];
j = 1; k = 1; l = 1; m = 1; n = 1; o = 1;

for i = 1:length(time)    %assuming first entry is of rtds:schedule
     s2 = vcpu{i};
%      if strcmp('runq_pick',event{i})
         vcpu{i} = s2(end-2:end-1);
         dom{i} = s2(end-6:end-5);
%      else ~strcmp('runq_pick',event{i}) && i>2
%          vcpu{i} = vcpu{i-1};
%          dom{i} = vcpu{i-1};
%      end
     pcpu{i} = sscanf(sprintf('%s ', pcpu{i}), '%d');
     vcpu{i} = sscanf(sprintf('%s ', vcpu{i}), '%d');
     dom{i} = sscanf(sprintf('%s',dom{i}),'%d');
     time(i) = time(i) - start_release;
     if time(i) <0 
         time(i) = 0;
     end
     
     if ~dom{i} && ~vcpu{i}  %for d0v0 - vcpu#1
%          y1(i)= pcpu{i};
%          y2(i)= -1;
%          y3(i)= -1;
%          y4(i)= -1;
%          y5(i)= -1;
%          y6(i)= -1;
           while j ~= i
                y1(j) = -1;
                j = j+1;
            end
           y1(j) = pcpu{i};
           j = j+1;
     elseif ~dom{i} && vcpu{i}  %for d0v1 - vcpu#2
%          y1(i)= -1;
%          y2(i)= pcpu{i};
%          y3(i)= -1;
%          y4(i)= -1;
%          y5(i)= -1;
%          y6(i)= -1; 
           while k ~= i
                y2(k) = -1;
                k = k+1;
           end
           y2(k) = pcpu{i};
           k = k+1;
     elseif dom{i} && ~vcpu{i}  %for d1v0 - vcpu#3
%          y1(i)= -1;
%          y2(i)= -1;
%          y3(i)= pcpu{i};
%          y4(i)= -1;
%          y5(i)= -1;
%          y6(i)= -1;
           while l ~= i
                y3(l) = -1;
                l = l+1;
           end
           y3(l) = pcpu{i};
           l = l+1;
     elseif dom{i} && vcpu{i}  %for d1v1 - vcpu#4
%          y1(i)= -1;
%          y2(i)= -1;
%          y3(i)= -1;
%          y4(i)= pcpu{i};
%          y5(i)= -1;
%          y6(i)= -1;
           while m ~= i
                y4(m) = -1;
                m = m+1;
           end
           y4(m) = pcpu{i};
           m = m+1;
     elseif dom{i} && vcpu{i}==2  %for d1v2 - vcpu#5
%          y1(i)= -1;
%          y2(i)= -1;
%          y3(i)= -1;
%          y4(i)= -1;
%          y5(i)= pcpu{i};
%          y6(i)= -1;
           while n ~= i
                y5(n) = -1;
                n = n+1;
           end
           y5(n) = pcpu{i};
           n = n+1;
     elseif dom{i} && vcpu{i}==3  %for d1v3 - vcpu#6
%          y1(i)= -1;
%          y2(i)= -1;
%          y3(i)= -1;
%          y4(i)= -1;
%          y5(i)= -1;
%          y6(i)= pcpu{i}; 
           while o ~= i
                y6(o) = -1;
                o = o+1;
           end
           y6(o) = pcpu{i};
           o = o+1;
     end

while j <= i
    y1(j) = -1;
    j = j+1;
end
while k<=i
    y2(k) = -1;
    k = k+1;
end
while l<=i
    y3(l) = -1;
    l = l+1;
end
while m <= i
    y4(m) = -1;
    m = m+1;
end
while n<=i
    y5(n) = -1;
    n = n+1;
end
while o <= i
    y6(o) = -1;
    o = o+1;
end

end

ms = double(time)/2903986;

stairs2(ms,y1,'o')
hold on;
stairs2(ms,y2,'diamond')
hold on
stairs2(ms,y3,'square')
hold on
stairs2(ms,y4,'+')
hold on
stairs2(ms,y5,'*')
hold on
stairs2(ms,y6,'x')
hold on
legend('d0v0','d0v1', 'd1v0', 'd1v1','d1v2','d1v3')
ylim([-1 2])
title('Scheduling on PCPUs')
xlabel('Time in ms')
ylabel('PCPU')

% % for i = 1:length(cpu)  %changed plotted values from vcpu to cpu
% % %     hold on
% %     color = getVcpuColor(cpu(i), nr_vcpu);
% %     plot(ms(i),cpu(i),'Color',color,'Marker','^')
% %     hold on
% % %     stairs2(ms(i),vcpu(i),'^')
% %             
% % end
% % stairs2(ms,vcpu,'^')
% % axis([0 ms(length(ms)) -1 2])
% ylim([-1 2])
% ylabel('cpu#')
% 
% 
% 
% fileID1 = fopen('D:\PENN\Summer_2017\RTDS scheduler\MC_matlab-master\testDir\schedule_copy.txt');
% C1 = textscan(fileID1,'%*s %u64 %*s %s %*s %*s %*s %*s %s %*s %*s %s %*s %*s %s %*s',10);
% fclose(fileID1);
% time1 = C1{1};
% start_release1 = time1(1);
% vcpu1 = C1{3};
% for i = 1:length(vcpu1)  
%     s21 = vcpu1{i};
%     vcpu1{i} = s21(end-2:end-1);
%     cpu1{i} = s21(end-6:end-5);
%     time1(i) = time1(i)-start_release1;
% end
%   
% S1 = sprintf('%s ', cpu1{:});
% cpu1 = sscanf(S1, '%d');
% ms1 = double(time1)/2903986;
% 
% close all;
% 
% fig = figure
% % plot(ms,vcpu)
% for i = 1:length(cpu)  %changed plotted values from vcpu to cpu
% %     hold on
%     color = getVcpuColor(cpu(i), nr_vcpu);
%     plot(ms(i),cpu(i),'Color',color,'Marker','^')
%     hold on
% %     stairs2(ms(i),vcpu(i),'^')
%             
% end
% % stairs2(ms1,cpu1)
% x=ms1;
% y= cpu1;
% hold on;
% fig2 = figure 
%     for i=1:length(x)-1
%         %plot(x(i:i+1),[y(i) y(i)],'LineWidth',2)
%         plot(x(i:i+1),[y(i) y(i)],'Marker', '<');
% 
%         hold on;
%     end
% % hold off
% ylim([-1 2])
