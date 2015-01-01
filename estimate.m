function x = estimate(xbar, ybar, l, z, r)

	z = z * pi / 180;
	r = r / (pi / 180)^2;

	x0 = [xbar; ybar];

	n = length(r);
	R = zeros(n, n);

	H = zeros(n, 2);

	zbar = zeros(n, 1);
	dz = zeros(n, 1);

	for i = 1:n
		R(i, i) = r(i);
		zbar(i) = atan(ybar / (xbar - l(i)));
		dz(i) = z(i) - zbar(i);
		H(i, 1) = -ybar / ((xbar - l(i))^2 + ybar^2);
		H(i, 2) = (xbar - l(i)) / ((xbar - l(i))^2 + ybar^2);
	end

	P = (H' * R^-1 * H)^-1;
	K = P * H' * R^-1;
	dx = K * dz;
	x = x0 + dx;

end
