function theta = M2theta(e, M)
	psi = kepler(e, M);
	theta = 2 * atan(sqrt((1 + e) / (1 - e)) * tan(psi / 2)) * 180 / pi;
end
