clear
%mittpunkter f?r cirkel a och b
ac = [93 63];
bc = [6 16];
%radie f?r cirkel a och b
la = 55.1;
lb = 46.2;
%spannet f?r vinkeln p? en cirkel
tv = [0:0.01:2*pi];

%Ekvationerna
%(xa-xp)^2 + (ya-yp)^2 = la;
%(xb-xp)^2 + (yb-yp)^2 = lb;
%f = (ac(1)-xp)^2+(ac(2)-yp)^2-la;

%Linje mellan de tv? mittpunkterna (inget vi anv?nder)
line = [(ac(1)+bc(1))/2 (ac(2)+bc(2))/2];

%plot av cirklar, mittpunkter och linje
circle(ac(1),ac(2),2*pi/60,la,0)
hold on
circle(bc(1),bc(2),2*pi/60,lb,0)
hold on
plot(ac(1),ac(2),'*')
plot(bc(1),bc(2),'*')
plot([ac(1) bc(1)],[ac(2) bc(2)])
%plot(line(1),line(2),'o')

%De v?rden vi s?ker, taget med andra metoder
correctish = [40.350392969598097  46.892714782653982;
  50.737033508938509  27.929820294140509];
%samma v?rden som innan
AC = [93,63];
BC = [6,16];
la = 55.1;
lb = 46.2;
%Startv?rden
x = [40 50]'; iter = 0; dxnorm = 1;
%ekvationerna (anv?nds ej i utr?kning)
f1 = (AC(1)-x(1))^2+(AC(2)-x(2))^2 - la^2;
f2 = (BC(1) - x(1))^2+(BC(2)-x(2))^2 - lb^2;

%newtons metod f?r ickelinj?ra ekvationssystem, fr?n boken
while dxnorm>0.5e-4 && iter<10
    %ekvationerna i ett gemensamt system
   f = [(AC(1)-x(1))^2+(AC(2)-x(2))^2 - la^2
       (BC(1) - x(1))^2+(BC(2)-x(2))^2 - lb^2];
   %jakobianen f?r ekvationerna, derivatan med avseende p? x(1) och x(2)
   J = [(-2*AC(1)+2*x(1))    (-2*AC(2)+2*x(2))
        (-2*BC(1)+2*x(1))    (-2*BC(2)+2*x(2))];
   dx = -J\f;
   x = x + dx;
   dxnorm = norm(dx,inf); iter = iter + 1;
end
x, iter
hold on
%plotta funnen punkt
plot(x(1),x(2),'o')

%samma grej fast andra startv?rden
x = [50 30]'; iter = 0; dxnorm = 1;
f1 = (AC(1)-x(1))^2+(AC(2)-x(2))^2 - la^2;
f2 = (BC(1) - x(1))^2+(BC(2)-x(2))^2 - lb^2;
while dxnorm>0.5e-4 && iter<10
   f = [(AC(1)-x(1))^2+(AC(2)-x(2))^2 - la^2
       (BC(1) - x(1))^2+(BC(2)-x(2))^2 - lb^2];
   J = [(-2*AC(1)+2*x(1))    (-2*AC(2)+2*x(2))
        (-2*BC(1)+2*x(1))    (-2*BC(2)+2*x(2))];
   dx = -J\f;
   x = x + dx;
   dxnorm = norm(dx,inf); iter = iter + 1;
end
x, iter

hold on
%plotta funnen punkt
plot(x(1),x(2),'o')


