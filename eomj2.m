function ydot = eomj2(t, y)

mu = 398601;
j2 = 1.0826e-3;
Re = 6378.14;
A = j2 * Re^2 / 2;

ydot = zeros(6, 1);

r = y(1:3);
rz = r(3);
v = y(4:6);

lr = normest(r);

ydot(1:3) = v;
ydot(4:6) = mu * (-r / lr^3 + A * (15 * rz^2 * r / lr^7 - [3; 3; 9] .* r / lr^5));
end
