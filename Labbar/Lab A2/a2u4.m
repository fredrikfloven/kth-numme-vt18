%Th = h*(sum(fun)-(f(1)+f(n+1))/2);
clear
time = cputime;
a = -5; 
b = 5; 
n = 20;
h = (b-a)/n;
x = h*(0:n);
fv = [];
for i = 1:length(x)
    fv = [fv fq(x(i))];
end
T20 = h*(sum(fv)-(fv(1)+fv(n+1))/2)
time = cputime-time
time2 = cputime;
Salt20 = h/3*(fv(1)+2*sum(fv(3:2:end-2))+4*sum(fv(2:2:end))+fv(end))

n = n*2;
h = h/2;
x = h*(0:n);
fv = [];
for i = 1:length(x)
    fv = [fv fq(x(i))];
end
T40 = h*(sum(fv)-(fv(1)+fv(n+1))/2)
time = cputime - time2
time2 = cputime;

S40 = T40+(T40-T20)/3
Salt40 = h/3*(fv(1)+2*sum(fv(3:2:end-2))+4*sum(fv(2:2:end))+fv(end))

n = n*2;
h = h/2;
x = h*(0:n);
fv = [];
for i = 1:length(x)
    fv = [fv fq(x(i))];
end
T80 = h*(sum(fv)-(fv(1)+fv(n+1))/2)
time = cputime - time2

S80 = T80+(T80-T40)/3
Salt80 = h/3*(fv(1)+2*sum(fv(3:2:end-2))+4*sum(fv(2:2:end))+fv(end))


format long
[T20 0 Salt20
 T40 S40 Salt40
 T80 S80 Salt80]





