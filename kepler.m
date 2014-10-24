function psi = kepler(e, M)
	if M > pi
		psi = M - e / 2;
	else
		psi = M + e / 2;
	end
	
	error = 1e-8;
	psi = newton(@(psi) psi - e * sin(psi) - M, @(psi) 1 - e * cos(psi), psi, error);	
end
