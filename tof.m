function t = tof(a, e, r)
    mu = 398600;
    T = 2 * pi / sqrt(mu) * a^(3 / 2);
    T
    r
    
    theta = acos((a * (1 - e^2) / r - 1) / e);
    M = 2 * atan(sqrt((1 - e)/(1 + e)) * tan(theta / 2)) - e * sqrt(1 - e^2) * sin(theta) / (1 + e * cos(theta));
    t = M * T / (2 * pi);
end