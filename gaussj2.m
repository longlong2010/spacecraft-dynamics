function ydot = gaussj2(t, y)
mu = 398601;
j2 = 1.0826e-3;
Re = 6378.14;
ydot = zeros(6, 1);

a = y(1);
e = y(2);
i = y(3);
Omiga = y(4);
omiga = y(5);
M = y(6);

T = 2 * pi / sqrt(mu) * a^(3 / 2);
n = 2 * pi / T;
psi = kepler(e, M);
theta = 2 * atan(tan(psi / 2) * sqrt((1 + e) / (1 - e)));
lr = (1 - e^2) * a *  (1 / (1 + e * cos(theta)));

R = -mu / lr^2 * (3 / 2) * j2 * (Re / lr)^2 * (1 - 3 * (sin(i))^2 * (sin(omiga + theta))^2);
S = -mu / lr^2 * (3 / 2) * j2 * (Re / lr)^2 * (sin(i))^2 * sin(2 * (omiga + theta));
W = -mu / lr^2 * (3 / 2) * j2 * (Re / lr)^2 * sin(2 * i) * sin(omiga + theta);

%a
ydot(1) = 2 / (n * sqrt(1 - e^2)) * (e * sin(theta) * R + (1 + e * cos(theta)) * S);
%e
ydot(2) = sqrt(1 - e^2) / (n * a) * (sin(theta) * R + (cos(psi) + cos(theta)) * S);
%i
ydot(3) = 1 / (n * a * sqrt(1 - e^2)) * (lr / a) * cos(theta + omiga) * W;
%Omiga
ydot(4) = 1 / (n * a * sqrt(1 - e^2)) * (lr / a) * (sin(theta + omiga) / sin(i)) * W;
%omiga
ydot(5) = sqrt(1 - e^2) / (n * a * e) * (-R * cos(theta) + (1 + 1 / (1 + e * cos(theta))) * sin(theta) * S) - ydot(4) * cos(i);
%M
ydot(6) = n + (1 - e^2) / (n * a * e) * ((-2 * e / (1 + e * cos(theta)) + cos(theta)) * R - (1 + 1 / (1 + e * cos(theta))) * sin(theta) * S);
end
