n = [2 4 8 16 32];
h = [1 0.5 0.25 0.125 0.0625 0.03125];
thv = [];
for i = 1:length(h)
    x = -1+h(i):h(i):1-h(i);
    y = sqrt(x+2);
    th = h(i)*(0.5+sqrt(3)/2+sum(sqrt(2+x)));
    pause(0.5)
    h(i);
    th;
    w = abs(th-2.797434930860683);
    thv = [thv th];
end


%Richardson Extrapolation
%R(h) = (2^n*F(h/2)-F(h))/(2^n-1);
rv = [];
for j = 1:length(h)-1
    r = (2^2 * thv(j+1) - thv(j)) / (2^2-1);
    w = abs(r-2.797434930860683)
    rv = [rv r];
end
