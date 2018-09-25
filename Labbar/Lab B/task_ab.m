% Reset.
clear
close 
figure
clf
format long
hold on

% ===== FIRST ANGLE =====

% Starting values.
x0 = 0;
x1 = pi / 4;

% Solve.
[a, x, t, xv, yv, tv] = sec_rk(x0, x1, 19, 0);
av = [a];
% Calculate height/table plot (task b). Create a vector
% to store steps (one per meter) and heights at the specific 
% meter.
% Step-vector.
sv = [];
% Height-vector.
hv = [];

s = 0;
while (s < xv(end))
    % Interpolate to find height at particular step (meter).
    h = interp1(xv, yv, s);
   
    % Add to vectors.
    sv = [sv s];
    hv = [hv h];
   
    % Increment step.
    s = s + 1;
end

% Plot.
plot(sv, hv);

% Print table of meters and heights.
table1 = [sv' hv'];

% ===== SECOND ANGLE =====

% Starting values.
x0 = 0;
x1 = pi / 20;

% Solve.
[a, x, t, xv, yv, tv] = sec_rk(x0, x1, 19, 0);
av = [av a];
% Calculate height/table plot (task b). Create a vector
% to store steps (one per meter) and heights at the specific 
% meter.
sv = [];
hv = [];

s = 0;
while (s < xv(end))
    % Interpolate to find height at particular step (meter).
    h = interp1(xv, yv, s);
   
    % Add to vectors.
    sv = [sv s];
    hv = [hv h];
   
    % Increment step.
    s = s + 1;
end

% Plot.
plot(sv, hv);
grid
xlabel("Distance (meter)")
ylabel("Height (meter)")
legend(num2str(av(1)),num2str(av(2)))
axis([0 20 0 10])

% Print table of meters and heights.
table2 = [sv' hv'];

table1, table2



