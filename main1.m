close all
clear all
clc

% initial condition
r0 = 8000;
theta0 = 0;
rdot0 = 0;
%thetadot0 = 7 / 8000;
%thetadot0 = 9 / 8000;
thetadot0 = 10 / 8000;


y0=[r0 theta0 rdot0 thetadot0];
tspan=[0 50000];
options = odeset('RelTol', 1e-8, 'AbsTol', 1e-8);
[t, y] = ode45('eom', tspan, y0, options);
polar(y(:, 2), y(:, 1));
