clear all;
close all;
clc;

mu = 398601;
Re = 6378.14;

%6.1
m = 20;
M = 460;
R = 0.6;
r = 0.1;
h = 0.1;
H = 2;
L = 10;
ha = 800;

d1 = M / (M + m) * (L + (h + H) / 2);
d2 = m / (M + m) * (L + (h + H) / 2);

omiga0 = sqrt(mu / (Re + ha)^3);

I = zeros(4, 1);
I(1) = (1 / 12) * m * h^2 + m * d1^2 + (1 / 12) * M * H^2 + M * H^2;
I(2) = I(1);
I(3) = (1 / 2) * m * r^2 + (1 / 2) * M * R^2;
I(4) = 0.8;

b = 0.002;

x0 = [0; 10 / 180 * pi; 0];

tspan = [0 1500];
options = odeset('RelTol', 1e-8, 'AbsTol', 1e-8);
[t, y] = ode45('euler6', tspan, x0, options, I, omiga0, b);

%6.2
I = zeros(3, 1);
I(1) = 1000;
I(2) = 500;
I(3) = 700;

K = [1000; 500; 700];
Kd = [-2000; -1000; -1400];

ha = 800;

theta = -40 * pi / 180;
phi = 40 * pi / 180;
psi = -60 * pi / 180;

omiga0 = sqrt(mu / (Re + ha)^3);

A(1, 1) = cos(theta) * cos(psi);
A(1, 2) = cos(theta) * sin(psi);
A(1, 3) = -sin(theta);
A(2, 1) = -cos(phi) * sin(psi) + sin(phi) * sin(theta) * cos(psi);
A(2, 2) = cos(phi) * cos(psi) + sin(phi) * sin(theta) * sin(psi);
A(2, 3) = sin(phi) * cos(theta);
A(3, 1) = sin(phi) * sin(psi) + cos(phi) * sin(theta) * cos(psi);
A(3, 2) = -sin(phi) * cos(psi) + cos(phi) * sin(theta) * sin(psi);
A(3, 3) = cos(phi) * cos(theta);

alpha = acos((trace(A) - 1) / 2);
e1 = (A(2, 3) - A(3, 2)) / (2 * sin(alpha));
e2 = (A(3, 1) - A(1, 3)) / (2 * sin(alpha));
e3 = (A(1, 2) - A(2, 1)) / (2 * sin(alpha));

qt = zeros(4, 1);

qt(1) = e1 * sin(alpha / 2);
qt(2) = e2 * sin(alpha / 2);
qt(3) = e3 * sin(alpha / 2);
qt(4) = cos(alpha / 2);

Qt = [
	qt(4) qt(3) -qt(2) qt(1);
	-qt(3) qt(4) qt(1) qt(2);
	qt(2) -qt(1) qt(4) qt(3);
	-qt(1) -qt(2) -qt(3) qt(4);
];

x0 = zeros(10, 1);
x0(7) = 1;

tspan = [0 15];
options = odeset('RelTol', 1e-4, 'AbsTol', 1e-4);
[t, y] = ode45('eom6', tspan, x0, options, I, omiga0, K, Kd, Qt);

hold on;
plot(t, y(:, 8) * 180 / pi);
plot(t, y(:, 9) * 180 / pi);
plot(t, y(:, 10) * 180 / pi);
