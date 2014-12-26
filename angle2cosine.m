function A = angle2cosine(phi, theta, psi)
	A = zeros(3, 3);
	A(1, 1) = cos(theta) * cos(psi);
	A(1, 2) = cos(theta) * sin(psi);
	A(1, 3) = -sin(theta);
	A(2, 1) = -cos(phi) * sin(psi) + sin(phi) * sin(theta) * cos(psi);
	A(2, 2) = cos(phi) * cos(psi) + sin(phi) * sin(theta) * sin(psi);
	A(2, 3) = sin(phi) * cos(theta);
	A(3, 1) = sin(phi) * sin(psi) + cos(phi) * sin(theta) * cos(psi);
	A(3, 2) = -sin(phi) * cos(psi) + cos(phi) * sin(theta) * sin(psi);
	A(3, 3) = cos(phi) * cos(theta);
end
