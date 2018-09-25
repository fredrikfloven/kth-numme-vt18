% ===== SECANT METHOD =====
% Wraps the Runge-Kuttas method.

% Secant method.
% Returns angle, landing point, time, xvector, yvector, timevector
% Takes as parameters: starting values (x0) and (x1), throwing speed (speed) and
% motvind (uw)
function [a, x, t, xv, yv, tv] = sec_rk(x0, x1, speed, uw)

offset = 20;
% Testing that the absolute error is less than 1e-5.
% Testing that the offset from the target is less than 1e-2.
while abs(x0-x1)>=1e-5 || offset > 1e-2
    % Perform secant method to approximate value.
    x2 = x1 - (x1 - x0) / (f2(x1, speed, uw) - f2(x0, speed, uw)) * f2(x1, speed, uw);
    
    % Assign values.
    x0 = x1;
    x1 = x2;
    
    [x, ~, ~, ~, ~] = rk(x1, speed, uw);
    offset = abs(20 - x);
end

% Return the final result % 2 * pi.
a = mod(x1, 2 * pi);
[x, t, xv, yv, tv] = rk(x1, speed, uw);
end

% ===== SECANT F(X) METHOD =====
% Helper function for above.

% Function for secant method (below).
function r = f2(a, speed, uw)
% Throw.
[x, ~, ~, ~, ~] = rk(a, speed, uw);

% Target x i 20. Value both being close "before" and "after"
% the goal.
r = abs(x - 20);
end