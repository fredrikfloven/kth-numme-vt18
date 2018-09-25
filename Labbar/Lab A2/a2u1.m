clear
format long
ac = [93 63];
bc = [6 16];
cc = [20,83];
la = 55.1;
lb = 46.2;
lc = 46.2;

tv = [0:0.01:2*pi];

%(xa-xp)^2 + (ya-yp)^2 = la;
%(xb-xp)^2 + (yb-yp)^2 = lb;

%f = (ac(1)-xp)^2+(ac(2)-yp)^2-la;

line = [(ac(1)+bc(1))/2 (ac(2)+bc(2))/2];


circle(ac(1),ac(2),2*pi/60,la,0)
hold on
circle(bc(1),bc(2),2*pi/60,lb,0)
hold on
circle(cc(1),cc(2),2*pi/60,lc,0)
hold on
plot(ac(1),ac(2),'*')
plot(bc(1),bc(2),'*')
plot(cc(1),cc(2),'*')
plot([ac(1) bc(1)],[ac(2) bc(2)])
%plot(line(1),line(2),'o')

correctish = [40.350392969598097  46.892714782653982;
  50.737033508938509  27.929820294140509];

AC = [93,63];
BC = [6,16];
CC = [20,83];
la = 55.1;
lb = 46.2;
lc = 46.2;
%x = [40.3 47]'; 
x = [50.7 27.7];
iter = 0; 
dxnorm = 1;
f1 = (AC(1)-x(1))^2+(AC(2)-x(2))^2 - la^2;
f2 = (BC(1) - x(1))^2+(BC(2)-x(2))^2 - lb^2;
f3 = (CC(1) - x(1))^2+(CC(2)-x(2))^2 - lc^2;
fnorm = 0;
while dxnorm>0.5e-4 && iter<10
   f = [(AC(1)-x(1))^2+(AC(2)-x(2))^2 - la^2
       (BC(1) - x(1))^2+(BC(2)-x(2))^2 - lb^2
       (CC(1) - x(1))^2+(CC(2)-x(2))^2 - lc^2];
   J = [(-2*AC(1)+2*x(1))    (-2*AC(2)+2*x(2))
        (-2*BC(1)+2*x(1))    (-2*BC(2)+2*x(2))
        (-2*CC(1)+2*x(1))    (-2*CC(2)+2*x(2))];
   dx = -J\f;
   x = x + dx;
   dxnorm = norm(dx,inf) 
   iter = iter + 1;
   fnorm = norm(f)
end
x, iter
hold on
plot(x(1),x(2),'o')


