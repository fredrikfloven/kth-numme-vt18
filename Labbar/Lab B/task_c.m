% Reset.
clear
close 
figure
clf

% Wind vector.
uwv = -[0 2 10 20];
speedv = [19 19 25 39];

for i = 1:1:length(uwv)
    % Get wind and speed.
    uw = uwv(i);
    speed = speedv(i);
    
    uw, speed
    
    % Set suplot.
    subplot(2, 2, i)
    title(strcat(num2str(speed), ' km/h -', {' '}, num2str(uw * -1), ' km/h'))    
    axis([0 20 0 10])
    grid
    xlabel("Distance (meter)")
    ylabel("Height (meter)")
    hold on

    % ===== UPPER CURVE =====
    % Starting values for "upper" curve.
    x0 = 0;
    x1 = pi / 4;
   
    % Simulate and plot throw.
    [a, x, t, xv, yv, ~] = sec_rk(x0, x1, speed, uw);
    angle1 = a;
    
    plot(xv, yv, '--');
    
    % ===== LOWER CURVE =====
    % Starting values for "lower" curve.
    x0 = 0;
    x1 = pi / 20;
   
    % Simulate and plot throw.
    [a, x, t, xv, yv, ~] = sec_rk(x0, x1, speed, uw);
    
    angle2 = a;
    plot(xv, yv, '--');
    
    % Set legend.
    legend(num2str(angle1), num2str(angle2))
    x,uw
end


