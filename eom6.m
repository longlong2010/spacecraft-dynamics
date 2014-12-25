function xdot = eom6(t, x, flag, I, omiga0, K, Kd, Qt)
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

	Omiga = [
		0 omiga(3) -omiga(2) omiga(1);
		-omiga(3) 0 omiga(1) omiga(2);
		omiga(2) -omiga(1) 0 omiga(3);
		-omiga(1) -omiga(2) -omiga(3) 0;
	];

	qdot = 0.5 * Omiga * q;
	
	Q = [0 -q(3) q(2);
		 q(3) 0 -q(1);
		 -q(2) q(1) 0;
		];
	
	qe = Qt * [-q(1); -q(2); -q(3); q(4)];

	A = (q(4)^2 - q(1:3)' * q(1:3)) * [1 0 0; 0 1 0; 0 0 1] + 2 * q(1:3) * q(1:3)' - 2 * q(4) * Q;

	omiga_ri = A * [0; -omiga0; 0];
	omiga_br = omiga - omiga_ri;

	Tc = 2 * K .* qe(1:3) * qe(4) + Kd .* omiga_br;

	if t > 1
		M = Tc;
	end

	omigadot(1) = (M(1) + (I(2) - I(3)) * omiga(2) * omiga(3)) / I(1);
	omigadot(2) = (M(2) + (I(3) - I(1)) * omiga(1) * omiga(3)) / I(2);
	omigadot(3) = (M(3) + (I(1) - I(2)) * omiga(1) * omiga(2)) / I(3);

	xdot(1:3) = omigadot;
	xdot(4:7) = qdot;
	xdot(8) = omiga_br(1) + (omiga_br(2) * sin(phi) + omiga_br(3) * cos(phi)) * tan(theta);
	xdot(9) = omiga_br(2) * cos(phi) - omiga_br(3) * sin(phi);
	xdot(10) = (omiga_br(2) * sin(phi) + omiga_br(3) * cos(phi)) / cos(theta);
end
