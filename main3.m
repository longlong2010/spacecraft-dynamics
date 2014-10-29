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

%直接计算变化率
s = elementsdotj2(a, e, i);

Omigadot = s(1)
omigadot = s(2)

%计算初始的位置和速度
s = rv(a, e, i, Omiga, omiga, theta);
r0 = s(7:9);
v0 = s(10:12);

y0 = [r0; v0];

%计算周期
T = 2 * pi * a^(3 / 2) / sqrt(mu);

%求解四个周期的J2摄动的运动微分方程
tspan=[0 4 * T];
options = odeset('RelTol', 1e-8, 'AbsTol', 1e-8);
[t, y] = ode45('eomj2', tspan, y0, options);

steps = length(y);
orbit_elements = zeros(steps, 5);

%对于每一个时刻的位置和速度计算轨道参数
for k = 1:steps
	s = elements(y(k, 1:3), y(k, 4:6));
	orbit_elements(k, :) = s(1:5);
end

%计算四个周期升交点赤经和近地点幅角的平均变化率
(orbit_elements(steps, 4) - orbit_elements(1, 4)) / (4 * T)
(orbit_elements(steps, 5) - orbit_elements(1, 5)) / (4 * T)

%绘制图像
for k = 1:5
	figure(k);
	plot(t, orbit_elements(:,k));
end

%计算初始的平近点角
M = 2 * atan(sqrt((1 - e)/(1 + e)) * tan(theta * pi / 360)) - e * sqrt(1 - e^2) * sin(theta * pi / 180) / (1 + e * cos(theta * pi / 180));
M * 180 / pi
y0 = [a; e; i * pi / 180; Omiga * pi / 180; omiga * pi / 180; M];

%求解四个周期的高斯方程
tspan=[0 4 * T];
options = odeset('RelTol', 1e-8, 'AbsTol', 1e-8);
[t, y] = ode45('gaussj2', tspan, y0, options);
y(:,3) = y(:,3) * 180 / pi;
y(:,4) = y(:,4) * 180 / pi;
y(:,5) = y(:,5) * 180 / pi;

steps = length(y);
%计算四个周期升交点赤经和近地点幅角的平均变化率
(y(steps, 4) - y(1, 4)) / (4 * T)
(y(steps, 5) - y(1, 5)) / (4 * T)
for k = 1:5
	figure(k + 5);
	plot(t, y(:,k));
end
