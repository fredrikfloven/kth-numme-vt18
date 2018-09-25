function t = triangle(xCoord,yCoord,line)
side1 = sqrt((xCoord(2)-xCoord(1)).^2+(yCoord(2)-yCoord(1)).^2);
side2 = sqrt((xCoord(3)-xCoord(2)).^2+(yCoord(3)-yCoord(2)).^2);
side3 = sqrt((xCoord(3)-xCoord(1)).^2+(yCoord(3)-yCoord(1)).^2);
txt1 = num2str(side1);
txt2 = num2str(side2);
txt3 = num2str(side3);
omkrets = side1+side2+side3;
semi = omkrets/2;
area = sqrt(semi.*(semi-side1).*(semi-side2).*(semi-side3)); %heron's formula
txt4 = num2str(omkrets);
txt5 = num2str(area);
t = plot(xCoord,yCoord,line);
text((xCoord(1)+xCoord(2))/2,(yCoord(1)+yCoord(2))/2,txt1);
text((xCoord(2)+xCoord(3))/2,(yCoord(2)+yCoord(3))/2,txt2);
text((xCoord(1)+xCoord(3))/2,(yCoord(1)+yCoord(3))/2,txt3);
text(0.2,6.5,['Circumference: ',txt4]);
text(0.2,6,['Area: ',txt5]);