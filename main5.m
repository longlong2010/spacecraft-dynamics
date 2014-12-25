clear all;
close all;
clc;

I = [50; 50; 54];
tspan = [0 15];
omiga0 = [0; 0; 6];
options = odeset('RelTol', 1e-8, 'AbsTol', 1e-8, 'MaxStep', 1e-2);
[t, omiga] = ode45('euler5', tspan, omiga0, options, I);

h = zeros(length(omiga), 3);
for k = 1:3
	h(:, k) = I(k) * omiga(:, k);
end

theta = zeros(length(h));
for k = 1:length(h)
	theta(k, 1) = acos(h(k, 3) / normest(h(k, :)));
end

figure(1);
plot(t, theta);

figure(2);
hold on;
plot(t, omiga(:, 1));
plot(t, omiga(:, 2), 'r');