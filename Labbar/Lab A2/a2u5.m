%cos(v1) + cos(v2) = 1.3;
%sin(v1) + sin(v2) = 1.3;
clear

%plotta de tv? graferna som ger r?tt svar
%Ju mindre den f?rsta vinkeln ?r, s? m?ste den andra bli st?rre f?r att
%hamna r?tt
a = 0.40465363702363;
subplot(2,1,1), plot_robotarm([pi/4-a,pi/4+a]);
subplot(2,1,2), plot_robotarm([pi/4+a,pi/4-a])

%pi/8 ~ pi/4 - 0.4
%pi/3 ~pi/4 + 0.4
v = [pi/8 pi/3]'; iter = 0; dvnorm = 1;
while dvnorm>0.5e-4 && iter<5
    f = [cos(v(1))+cos(v(2))-1.3
        sin(v(1))+sin(v(2))-1.3];
    J = [(-sin(v(1))) (-sin(v(2)))
        (cos(v(1))) (cos(v(2)))];
    dv = -J\f
    C = cond(dv)
    v = v + dv
   dvnorm = norm(dv,inf) 
   iter = iter + 1;
end
vinkel1 = v(1)
vinkel2 = v(2)
iter

vinkel1_2 = v(2)
vinkel2_2 = v(1)

thetav = v;

gamma = 4;
beta = 0.5;
w = 3*pi;
alpha = 2;

thetaprickprick1(t) = -alpha * (theta1(t)-thetav(1))-gamma*thetaprick1(t)+beta*sin(w*t)
