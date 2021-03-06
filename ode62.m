function xdot = ode62(t, x, flag, I, omiga0, K, Kd, Qt)
	xdot = zeros(10, 1);
	omigadot = zeros(3, 1);
	qdot = zeros(4, 1);
	M = zeros(3, 1);
	Tc = zeros(3, 1);
	Td = zeros(3, 1);

	omiga = x(1:3);
	q = x(4:7);

	phi = x(8);
	theta = x(9);
	psi = x(10);

	
	qe = Qt * [-q(1); -q(2); -q(3); q(4)];

	A = q2cosine(q);
	omiga_ri = A * [0; -omiga0; 0];
	omiga_br = omiga - omiga_ri;

	Omiga = [
		0 omiga_br(3) -omiga_br(2) omiga_br(1);
		-omiga_br(3) 0 omiga_br(1) omiga_br(2);
		omiga_br(2) -omiga_br(1) 0 omiga_br(3);
		-omiga_br(1) -omiga_br(2) -omiga_br(3) 0;
	];

	qdot = 0.5 * Omiga * q;
	Tc = 2 * K .* qe(1:3) * qe(4) + Kd .* omiga_br;

	if t > 1
		M = Tc;
	end

	omigadot = eulereq(omiga, I, M);

	xdot(1:3) = omigadot;
	xdot(4:7) = qdot;
	xdot(8) = omiga_br(1) + (omiga_br(2) * sin(phi) + omiga_br(3) * cos(phi)) * tan(theta);
	xdot(9) = omiga_br(2) * cos(phi) - omiga_br(3) * sin(phi);
	xdot(10) = (omiga_br(2) * sin(phi) + omiga_br(3) * cos(phi)) / cos(theta);
end
