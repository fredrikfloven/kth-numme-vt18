function c = circle(xc,yc,step,r,u6)
hold on
x = xc + r*cos(0:step:2*pi);
y = yc + r*sin(0:step:2*pi);
if u6 == 1
    if r~=1
        c = plot(x,y);
    else
        c = plot(x,y), fill(x,y,'r');
    end
    text(0-0.5,r-0.5,num2str(11-r));
else
    c = plot(x,y);
end
%text(xc-1,yc,['Radie: ',num2str(r)]);
%text(xc-1,yc-0.5,['Omkrets: ',num2str(r*2*pi)]);
hold off
axis equal
end