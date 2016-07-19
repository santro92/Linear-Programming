function [] = plotGraph(n,x,y,X1,XInf,res1,resInf,t)
    figure(1)
    
    scatter(x,y,25,'b','filled');
    hold on
    xVal = 1:0.1:15;
    y1Val = zeros(1,length(xVal));
    yInfVal = zeros(1,length(xVal));
    
    for i = n:-1:0
        y1Val = y1Val + (X1(n-i+1) .* xVal.^i);
        yInfVal = yInfVal + (XInf(n-i+1) .* xVal.^i);
    end
    
    axis([0 16 0 16]);
    plot(xVal,y1Val,xVal,yInfVal,'--','LineWidth',2);
    title(t);
    legend('Data Points','L1 norm','L\infty norm');
    
    figure(2)
    subplot(2,1,1);
    hist(res1,10);
    title('L1 norm residual');
    subplot(2,1,2);
    hist(resInf,10);
    title('L\infty norm residual');
end

