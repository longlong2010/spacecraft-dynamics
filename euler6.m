function xdot = euler6(t, x, flag, I, omiga0, b)
	xdot = zeros(3, 1);

	omigaw = x(1);
	theta = x(2);
	thetadot = x(3);

	omigawdot = b * (thetadot - omigaw) / I(4);

	xdot(1) = omigawdot;
	xdot(2) = thetadot;
	xdot(3) = (3 * omiga0^2 * (I(3) - I(1)) * theta - I(4) * omigawdot) / I(2);
end
