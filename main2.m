clear all
close all
clc
%2.1
e = 0.7;
M = 1.5;
psi = kepler(e, M);
psi

mu = 398600;
e = 0.08;

T = 2 * pi / sqrt(mu) * 7580 ^ (3 / 2);
n = 2 * pi / T;


theta0 = 60.2;
x = rv(7580, 0.08, 7.5, 56.4, 22.5, theta0);
rpqw = x(1:3);
rpqw
vpqw = x(4:6);
vpqw

r = x(7:9);
r
v = x(10:12);
v

%2.3
M0 = theta2M(e, theta0)
M1 = M0 + n * 45 * 60;
theta1 = M2theta(e, M1);

x = rv(7580, 0.08, 7.5, 56.4, 22.5, theta1);
rpqw = x(1:3);
rpqw
vpqw = x(4:6);
vpqw

r = x(7:9);
r
v = x(10:12);
v
