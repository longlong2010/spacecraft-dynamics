function M = theta2M(e, theta)
	M = 2 * atan(sqrt((1 - e)/(1 + e)) * tan(theta * pi / 360)) - e * sqrt(1 - e^2) * sin(theta * pi / 180) / (1 + e * cos(theta * pi / 180));
end
