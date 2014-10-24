clear all
close all
clc

e = 0.7;
M = 1.5;
psi = kepler(e, M);
psi

mu = 398600;
e = 0.08;
T = 2 * pi / sqrt(mu) * 7580 ^ (3 / 2);
M = 2 * pi * 45 * 60 / T;
psi = kepler(e, M);
psi


%theta = 2 * atan(sqrt((1 + e) / (1 - e)) * tan(psi / 2));

s = rv(7580, 0.08, 7.5, 56.4, 22.5, 60.2);
rpqw = s(1:3);
rpqw
vpqw = s(4:6);
vpqw

r = s(7:9);
r
v = s(10:12);
v


r = [5027.675; 4218.720; 0];
v = [-5.79133; 6.90184; 4.89187];
s = elements(r, v);
t = tof(s(1), s(2), s(1) * (1 + s(2)));
t


s1 = rv(s(1), s(2), s(5), s(3), s(4), s(6));
rpqw = s1(1:3);
vpqw = s1(4:6);
