function ydot = eom(t, y)
mu = 398601;
ydot = zeros(4, 1);

r = y(1);
rdot = y(3);
thetadot = y(4);

% differnetial equations
ydot(1) = rdot;
ydot(2) = thetadot;
ydot(3) = r * thetadot^2 - mu / r^2;
ydot(4) = -2 * rdot * thetadot / r; 