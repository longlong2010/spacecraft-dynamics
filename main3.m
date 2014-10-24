clear all
close all
clc

mu = 398601;

a = 10000;
e = 0.2;
i = 20;
Omiga = 40;
omiga = 60;
theta = 90;

s = rv(a, e, i, Omiga, omiga, theta);
r0 = s(7:9);
v0 = s(10:12);

y0 = [r0; v0];

T = 2 * pi * a^(3 / 2) / sqrt(mu);

%tspan=[0 4 * T];
%options = odeset('RelTol', 1e-8, 'AbsTol', 1e-8);
%[t, y] = ode45('eomj2', tspan, y0, options);
%
%steps = length(y);
%orbit_elements = zeros(steps, 5);
%
%for k = 1:steps
%	s = elements(y(k, 1:3), y(k, 4:6));
%	orbit_elements(k, :) = s(1:5);
%end
%
%for k = 1:5
%	figure(k);
%	plot(t, orbit_elements(:,k));
%end


M = 2 * atan(sqrt((1 - e)/(1 + e)) * tan(theta * pi / 360)) - e * sqrt(1 - e^2) * sin(theta * pi / 180) / (1 + e * cos(theta * pi / 180));
y0 = [a; e; i * pi / 180; Omiga * pi / 180; omiga * pi / 180; M];

tspan=[0 40];
options = odeset('RelTol', 1e-8, 'AbsTol', 1e-8);
[t, y] = ode45('gaussj2', tspan, y0, options);

for k = 1:5
	figure(k);
	plot(t, y(:,k));
end
