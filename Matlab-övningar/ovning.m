%U1, kurvritning
clear
x1 = 0:0.01:4;
f = x1.*(1+sin(x1.*pi));
g = (5.*exp(-x1/2))./(3-2.*cos(2.*pi.*x1));
subplot(2,2,1), plot(x1,f,x1,g), title('f och g')
subplot(2,2,2), plot(x1,f+g), title('Summan f+g')
subplot(2,2,3), plot(x1,f.*g), title('Produkten f*g')
subplot(2,2,4), plot(x1,f./g), title('Kvoten f/g')

%U2, ytterligare funktionskurva
figure
x2 = -2:0.01:4;
y = (10./sqrt(1+x2.^2)) + (exp(x2./2))./(sqrt(2)+sin(pi.*x2)) + (4)./(x2-5);
plot(x2,y)

%U3, triangel
figure
xCoord = [0,4,6.5,0];
yCoord = [1.42,6.18,4.75,1.42];
triangle(xCoord,yCoord,'-')

%U4, Cirkel
figure
xc = 0;
yc = 1.42;
step = 2*pi/60;
r = 3;
circle(xc,yc,step,r,0)

%U5 tre tangerande cirklar
figure
triangle(xCoord,yCoord,'--')
side1 = sqrt((xCoord(2)-xCoord(1)).^2+(yCoord(2)-yCoord(1)).^2);
side2 = sqrt((xCoord(3)-xCoord(2)).^2+(yCoord(3)-yCoord(2)).^2);
side3 = sqrt((xCoord(3)-xCoord(1)).^2+(yCoord(3)-yCoord(1)).^2);
A = [1 1 0 ; 0 1 1 ; 1 0 1];
Sidor = [side1 side2 side3]';
k = A\Sidor;
circle(xCoord(1),yCoord(1),step,k(1),0)
circle(xCoord(2),yCoord(2),step,k(2),0)
circle(xCoord(3),yCoord(3),step,k(3),0)

%U6, pilkastning
figure
sum = 0;
%Rita upp m?ltavla
for i = 1:10
    circle(0,0,step,i,1);
end
hold on
%Kasta pilar
for pil=1:10
    xt = 5*randn;
    yt = 4*randn;
    points = 10-floor(sqrt(abs(xt)^2+abs(yt)^2));
    %Om utanf?r s? 0 po?ng
    if points<0
        points=0;
    end
    sum = sum + points;
    plot(xt, yt,'k*')
    text(xt+1,yt,num2str(points));
    pause(0.2)
end
hold off
sum


%U7 Stj?rnhimmel
figure
x = [0 5 0 3.5 3 0];
y = [0 2.8 3.3 0 5 0];
plot(x,y)
hold on
fill(x+4,y+4,'y')
axis equal
pause(1)
for i=1:15
    plot(x+rand*55,y+rand*40)
    fill(x+rand*55,y+rand*40,'y')
    pause(0.1)
end

%U8 Streckgubbefamilj
figure
h = 1.6;
r = 0.2;
person(0,h,r)
person(1,h,r)
person(2,h-0.5,r-0.05)
[X,Y] = ginput(6);
plot (X,Y,'o')

%U9
clear
figure
clf
axis([0 10 0 8])
hold on
[x,y]=ginput(3); 
%x=[]; y=[];
%for nr=1:3, [xp,yp]=ginput(1); plot(xp,yp,'*'), x=[x; xp]; y=[y; yp]; end
x = [x;x(1)];
y = [y;y(1)];
plot(x,y,'o')
step = 2*pi/60;
triangle(x,y,'--')
side1 = sqrt((x(2)-x(1)).^2+(y(2)-y(1)).^2);
side2 = sqrt((x(3)-x(2)).^2+(y(3)-y(2)).^2);
side3 = sqrt((x(3)-x(1)).^2+(y(3)-y(1)).^2);
A = [1 1 0 ; 0 1 1 ; 1 0 1];
Sidor = [side1 side2 side3]';
k = A\Sidor;
circle(x(1),y(1),step,k(1),0)
circle(x(2),y(2),step,k(2),0)
circle(x(3),y(3),step,k(3),0)

%U10, Svartkroppsstr?lningskurvor
figure
axis([0 250*10^(-8) 0 12*10^13]);
lambda = 0:0.0000000001:250*10^(-8);
xlabel('lambda')
ylabel('Temp')
alpha = 3.7415*10^(-16);
beta =  0.014388;
t = [3000, 4000, 5000, 6000];
hold on
for i = 3000:1000:6000
    w = alpha./(lambda.^5.*(exp(beta./(lambda.*i))-1));
    plot(lambda,w)
    text = num2str(i);
    gtext(['T= ',text])
end

%U11, polynom genom givna punkter





