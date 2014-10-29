clear all
close all
clc

mu = 398601;

%
a = 10000;
e = 0.2;
i = 20;
Omiga = 40;
omiga = 60;
theta = 90;

s = elementsdotj2(a, e, i);

Omigadot = s(1)
omigadot = s(2)

s = rv(a, e, i, Omiga, omiga, theta);
r0 = s(7:9);
v0 = s(10:12);

y0 = [r0; v0];

T = 2 * pi * a^(3 / 2) / sqrt(mu);

tspan=[0 4 * T];
options = odeset('RelTol', 1e-8, 'AbsTol', 1e-8);
[t, y] = ode45('eomj2', tspan, y0, options);

steps = length(y);
orbit_elements = zeros(steps, 5);

for k = 1:steps
	s = elements(y(k, 1:3), y(k, 4:6));
	orbit_elements(k, :) = s(1:5);
end

(orbit_elements(steps, 4) - orbit_elements(1, 4)) / (4 * T)
(orbit_elements(steps, 5) - orbit_elements(1, 5)) / (4 * T)

for k = 1:5
	figure(k);
	plot(t, orbit_elements(:,k));
end

M = 2 * atan(sqrt((1 - e)/(1 + e)) * tan(theta * pi / 360)) - e * sqrt(1 - e^2) * sin(theta * pi / 180) / (1 + e * cos(theta * pi / 180));
M * 180 / pi
y0 = [a; e; i * pi / 180; Omiga * pi / 180; omiga * pi / 180; M];

tspan=[0 4 * T];
options = odeset('RelTol', 1e-8, 'AbsTol', 1e-8);
[t, y] = ode45('gaussj2', tspan, y0, options);
y(:,3) = y(:,3) * 180 / pi;
y(:,4) = y(:,4) * 180 / pi;
y(:,5) = y(:,5) * 180 / pi;

steps = length(y);
(y(steps, 4) - y(1, 4)) / (4 * T)
(y(steps, 5) - y(1, 5)) / (4 * T)
for k = 1:5
	figure(k + 5);
	plot(t, y(:,k));
end

j2 = 1.0826e-3;
Re = 6378.14;
e = 0;
a = 860 + Re;
i = acos((2 * pi / (365 * 86400 + 6 * 3600 + 9 * 60 + 10)) * (2 / 3) * (1 - e^2)^2 * a^(7 / 2) / (sqrt(mu) * j2 * Re^2)) / pi * 180;
i
