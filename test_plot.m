%%% vectors which are plotted for pcpu1 and 2 are not of same length. 
%%% file input is xenalyze scatter plot output

fid = fopen('D:\PENN\Summer_2017\RTDS scheduler\schedule_plot\xenalyze_plot.txt');
s = textscan(fid,'%dv%d %f %d',50);
fclose(fid);
x = s{3};
y1 = [] ; y2 = []; y3 = [];
y4 =[]; y5 =[]; y6=[];
y7 = []; y8 = []; 
y9 = []; y10 = [];
y11 = []; y12 = [];
y13 = []; y14= [];
% x1 = [] ; x2 = []; x3 = [];
j = 1; k = 1; l=1; m=1;n=1;
o = 1; p =1; q =1; r= 1;
g=1; t=1; u=1; v=1;w=1;
a1 =1; b1=1;
% s1;
% s2;
for i = 1:length(s{4})
    if ~s{4}(i)
        s1{1}(a1) = s{1}(i);
        s1{2}(a1) = s{2}(i);
        s1{3}(a1) = s{3}(i);
        s1{4}(a1) = s{4}(i);
        a1 = a1+1;
    elseif s{4}(i)
        s2{1}(b1) = s{1}(i);
        s2{2}(b1) = s{2}(i);
        s2{3}(b1) = s{3}(i);
        s2{4}(b1) = s{4}(i);
        b1 = b1+1;
    end
end
x2 = s1{3};
x3 = s2{3};

for i = 1:length(s1{4})
%     if ~s{4}(i)  %for pcpu0    y1= y2+y3+y4
%         while j~=i
%             y1(j) = -1;
%             j = j+1;
%         end
        if ~s1{1}(i) && ~s1{2}(i)  %for dom0, vcpu0 0v0
            while k ~= i
                y2(k) = -1;
                k = k+1;
            end
            y2(k) = s1{2}(i)+1;
            k = k+1;
        elseif ~s1{1}(i) && s1{2}(i)   %for dom0. vcpu1 0v1
            while l ~= i
                y3(l) = -1;
                l = l+1;
            end
            y3(l) = s1{2}(i);
            l = l+1;
        elseif s1{1}(i) && ~s1{2}(i)   %for dom1, vcpu0 1v0
            while m ~= i
                y4(m) = -1;
                m = m+1;
            end
            y4(m) = s1{2}(i)+1;
            m = m+1;
        elseif s1{1}(i) && s1{2}(i)   %for dom1, vcpu0 1v1
            while r ~= i
                y9(r) = -1;
                r = r+1;
            end
            y9(r) = s1{2}(i);
            r = r+1;
        elseif s1{1}(i) && s1{2}(i)==2   %for dom1, vcpu0 1v2
            while g ~= i
                y10(g) = -1;
                g = g+1;
            end
            y10(g) = s1{2}(i)-1;
            g = g+1;
        elseif s1{1}(i) && s1{2}(i)==3   %for dom1, vcpu0 1v3
            while t ~= i
                y11(t) = -1;
                t = t+1;
            end
            y11(t) = s1{2}(i)-2;
            t = t+1;
        end
%         y1(j) = s{4}(i)+1;
%         x2(a1) = x(i);
%         j = j+1;
%         a1 = a1+1;
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
while r<=i
    y9(r) = -1;
    r = r+1;
end
while g <= i
    y10(g) = -1;
    g = g+1;
end
while t <= i
    y11(t) = -1;
    t = t+1;
end
end

for i = 1:length(s2{4})
%     elseif s{4}(i)   %for pcpu1    y5=y6+y7+y8
%         while n~=i
%             y5(n) = -1;
%             n = n+1;
%         end
        if ~s2{1}(i) && ~s2{2}(i)  %for dom0, vcpu0  0v0
            while o ~= i
                y6(o) = -1;
                o = o+1;
            end
            y6(o) = s2{2}(i)+2;
            o = o+1;
        elseif ~s2{1}(i) && s2{2}(i)   %for dom0. vcpu1 0v1
            while p ~= i
                y7(p) = -1;
                p = p+1;
            end
            y7(p) = s2{2}(i)+1;
            p = p+1;
        elseif s2{1}(i) && ~s2{2}(i)   %for dom1, vcpu0 1v0
            while q ~= i
                y8(q) = -1;
                q = q+1;
            end
            y8(q) = s2{2}(i)+2;
            q = q+1;
        elseif s2{1}(i) && s2{2}(i)   %for dom1, vcpu0 1v1
            while u ~= i
                y12(u) = -1;
                u = u+1;
            end
            y12(u) = s2{2}(i)+1;
            u = u+1;
        elseif s2{1}(i) && s2{2}(i)==2   %for dom1, vcpu0 1v2
            while v ~= i
                y13(v) = -1;
                v = v+1;
            end
            y13(v) = s2{2}(i);
            v = v+1;
        elseif s2{1}(i) && s2{2}(i)==3   %for dom1, vcpu0 1v3
            while w ~= i
                y14(w) = -1;
                w = w+1;
            end
            y14(w) = s2{2}(i)-1;
            w = w+1;
        end
%         y5(n) = s{4}(i)+1;
%         x3(b1) = x(i);
%         n = n+1;
%         b1 = b1+1;
while n <= i
    y5(n) = -1;
    n = n+1;
end
while o <= i
    y6(o) = -1;
    o = o+1;
end
while p <= i
    y7(p) = -1;
    p = p+1;
end
while q <= i
    y8(q) = -1;
    q = q+1;
end
while u <= i
    y12(u) = -1;
    u = u+1;
end
while v <= i
    y13(v) = -1;
    v = v+1;
end
while w <= i
    y14(w) = -1;
    w = w+1;
end
end
   
% while j<=i
%     y1(j) = -1;
%     j = j+1;
% end


% while a1 <= i
%     if a1 
%         x2(a1) = x2(a1);
%     else
%         x2(a1) = x2(a1-1);
%     end
%     a1 = a1+1;
% end
% while b1 <= i
%     if b1
%         x3(b1) = x3(b1);
%     else
%         x3(b1) = x3(b1-1);
%     end
%     b1 = b1+1;
% end
% end

% b(1) = subplot(2,1,1);
% stairs(x,y2,'marker','o','color','r')
stairs2(x2,y2,'o')
hold on;
% % stairs(x,y3,'marker','diamond','color','b')
stairs2(x2,y3,'diamond')
hold on
% % stairs(x,y4,'marker','square','color','g')
stairs2(x2,y4,'square')
hold on
stairs2(x2,y9,'+')
hold on
stairs2(x2,y10,'*')
hold on
stairs2(x2,y11,'x')
hold on
% % stairs(x,y6,'marker','o','color','r')
stairs2(x3,y6,'o')
hold on;
% % stairs(x,y7,'marker','diamond','color','b')
stairs2(x3,y7,'diamond')
hold on
% % stairs(x,y8,'marker','square','color','g')
stairs2(x3,y8,'square')
hold on
stairs2(x3,y12,'+')
hold on 
stairs2(x3,y13,'*')
hold on
stairs2(x3,y14,'x')
hold off;
legend('d0v0','d0v1', 'd1v0', 'd1v1','d1v2','d1v3')
% axis([0 s{3}(length(s{3})) -1 3])
ylim([-1 3])
title('Scheduling on PCPUs')
xlabel('Time in ms')
ylabel('PCPU')