function stairs2(x,y,marker)
    hold on;
    for i=1:length(x)-1
        plot(x(i:i+1),[y(i) y(i)],'LineWidth',2);
    end
    hold off;
end

