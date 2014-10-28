function y = elementsdotj2(a, e, i)
	mu = 398600;
	j2 = 1.0826e-3;
	Re = 6378.14; 
	y = zeros(2, 1);
	i = i * pi / 180;
	Omigadot = -((3 / 2) * sqrt(mu) * j2 * Re^2 / ((1 - e^2) * a^(7/2))) * cos(i);
	omigadot = -((3 / 2) * sqrt(mu) * j2 * Re^2 / ((1 - e^2) * a^(7/2))) * ((5 / 2) * sin(i)^2 - 2);
	y(1) = Omigadot * 180 / pi;
	y(2) = omigadot * 180 / pi;
end
