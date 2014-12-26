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
T = 2 * pi / omiga0;

I = zeros(4, 1);
I(1) = (1 / 12) * m * h^2 + m * d1^2 + (1 / 12) * M * H^2 + M * H^2;
I(2) = I(1);
I(3) = (1 / 2) * m * r^2 + (1 / 2) * M * R^2;
I(4) = 0.8;

%6.1.1
t = 0:0.1:T;
y = 10 * cos(omiga0 * sqrt(3 * (I(1) - I(3)) / I(2)) * t);
figure(1);
plot(t, y);


b = 0.002;

x0 = [0; 10 / 180 * pi; 0];

tspan = [0 880];
options = odeset('RelTol', 1e-8, 'AbsTol', 1e-8);
[t, y] = ode45('ode61', tspan, x0, options, I, omiga0, b);
tn = 0;
for i = 1:length(y(:, 2))
	if y(i, 2) < 1 * pi / 180
		tn = t(i);
		break;
	end
end
n = tn / T;

%6.1.2
figure(2);
plot(t, y(:, 2) * 180 / pi);

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

A = angle2cosine(phi, theta, psi);

qt = cosine2q(A);

Qt = [
	qt(4) qt(3) -qt(2) qt(1);
	-qt(3) qt(4) qt(1) qt(2);
	qt(2) -qt(1) qt(4) qt(3);
	-qt(1) -qt(2) -qt(3) qt(4);
];

x0 = zeros(10, 1);
x0(2) = -omiga0;
x0(7) = 1;

tspan = [0 15];
options = odeset('RelTol', 1e-4, 'AbsTol', 1e-4);
[t, y] = ode45('ode62', tspan, x0, options, I, omiga0, K, Kd, Qt);

Tc = zeros(length(y), 3);
for i = 1:length(y)
	omiga = y(i, 1:3)';
	q = y(i, 4:7)';
	qe = Qt * [-q(1); -q(2); -q(3); q(4)];

	A = q2cosine(q);

	omiga_ri = A * [0; -omiga0; 0];
	omiga_br = omiga - omiga_ri;
	if t(i) > 1
		Tc(i, :) = (2 * K .* qe(1:3) * qe(4) + Kd .* omiga_br)';
	end
end

hold on;
%euler angle
figure(3);
plot(t, y(:, 8) * 180 / pi);
figure(4);
plot(t, y(:, 9) * 180 / pi);
figure(5);
plot(t, y(:, 10) * 180 / pi);
%q
figure(6);
plot(t, y(:, 4));
figure(7);
plot(t, y(:, 5));
figure(8);
plot(t, y(:, 6));
figure(9);
plot(t, y(:, 7));
%Tc
figure(10);
plot(t, Tc(:, 1));
figure(11);
plot(t, Tc(:, 2));
figure(12);
plot(t, Tc(:, 3));
