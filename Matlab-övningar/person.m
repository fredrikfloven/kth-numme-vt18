function p = person(location,height,radius)
step = 2*pi/60;
length = height/2;
sublength = length/3;
circle(location,height,step,radius,0);
hold on
%Body
bx = [location location];
by = [length height-radius];
plot(bx,by);
%Legs
lx = [location-sublength location location+sublength];
ly = [0 length 0];
plot(lx,ly);
%Arms
ax = [location-sublength location location+sublength];
ay = [height-radius-length height-radius height-radius-length];
p = plot(ax,ay);