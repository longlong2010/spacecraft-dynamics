function A = q2cosine(q)
	Q = [0 -q(3) q(2);
		 q(3) 0 -q(1);
		 -q(2) q(1) 0;
		];
	A = (q(4)^2 - q(1:3)' * q(1:3)) * [1 0 0; 0 1 0; 0 0 1] + 2 * q(1:3) * q(1:3)' - 2 * q(4) * Q;
end
