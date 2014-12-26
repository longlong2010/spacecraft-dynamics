function q = cosine2q(A)

	alpha = acos((trace(A) - 1) / 2);
	e1 = (A(2, 3) - A(3, 2)) / (2 * sin(alpha));
	e2 = (A(3, 1) - A(1, 3)) / (2 * sin(alpha));
	e3 = (A(1, 2) - A(2, 1)) / (2 * sin(alpha));

	q = zeros(4, 1);

	q(1) = e1 * sin(alpha / 2);
	q(2) = e2 * sin(alpha / 2);
	q(3) = e3 * sin(alpha / 2);
	q(4) = cos(alpha / 2);
end
