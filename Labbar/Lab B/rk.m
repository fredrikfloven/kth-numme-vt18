% ===== RUNGE-KUTTAS METHOD =====
% Simulates a throw for a particular angle. Will return landing
% position (x), landing time (t) and vectors for x, y, and t
% during "flight".

function [x, t, xv, yv, tv] = rk(a, speed, uw)

% ===== VALUES =====
kx = 0.020;
ky = 0.065;
g = 9.81;

% ===== EQUATIONS =====
V = @(u, v) (sqrt((u - uw) ^ 2 + v ^ 2));
uprime = @(u, v) (-kx * (u - uw) * V(u, v));
vprime = @(u, v) (-g - ky * v * V(u, v));

% ===== SOLVE EQUATIONS =====
    
% Start guess, speed m/s speed at pi / 4 angle.
u = speed * cos(a);
v = speed * sin(a);

% Step size for Runge?Kutta method.
h = 0.001;
t = 0;

% Lists for tracking changes. Starting at x = 0, y = 1.5, t = 0.
xv = [0];
yv = [1.5];
tv = [t];


% Check if the last y is above ground.
while yv(end) > 0
    % Calculate k's for Runge-Kutta method.
    % Reference: https://en.wikipedia.org/wiki/Runge%E2%80%93Kutta_methods

    uk1 = h * uprime(u, v);
    uk2 = h * uprime(u + uk1 / 2, v + uk1 / 2);
    uk3 = h * uprime(u + uk2 / 2, v + uk2 / 2);
    uk4 = h * uprime(u + uk3, v + uk3);

    vk1 = h * vprime(u, v);
    vk2 = h * vprime(u + vk1 / 2, v + vk1 / 2);
    vk3 = h * vprime(u + vk2 / 2, v + vk2 / 2);
    vk4 = h * vprime(u + vk3, v + vk3);

    % Increment current value using the above k's.
    u = u + (1 / 6) * (uk1 + 2 * uk2 + 2 * uk3 + uk4);
    v = v + (1 / 6) * (vk1 + 2 * vk2 + 2 * vk3 + vk4);

    % Take the last x value in the list, and add the 
    % calculated change (u) * step size (h).
    xv = [xv (xv(end) + u * h)];

    % Take the last y value in the list, and add the 
    % calculated change (y) * step size (h).
    yv = [yv (yv(end) + v * h)];

    % Take the last t and add step size (h).
    tv = [tv (tv(end) + h)];
end

% Interpolate over the y and x/t. And look at the point
% where y is zero. 

x = interp1(yv, xv, 0);
t = interp1(yv, tv, 0);



