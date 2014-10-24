function y = rv(a, e, i, Omiga, omiga, theta)
    i = i * pi / 180;
	Omiga = Omiga * pi / 180;
	omiga = omiga * pi / 180;
	theta = theta * pi / 180;

	mu = 398600;
    y = zeros(12, 1);

    lh = sqrt(mu * (1 - e^2) * a);
	
	rpqw = (lh^2 / mu) * (1 / (1 + e * cos(theta))) * [cos(theta); sin(theta); 0];   
	vpqw = (mu / lh) * [-sin(theta); e + cos(theta); 0];
	
	q1 = [cos(omiga) sin(omiga) 0; -sin(omiga) cos(omiga) 0; 0 0 1];
	q2 = [1 0 0; 0 cos(i) sin(i); 0 -sin(i) cos(i)]; 
	q3 = [cos(Omiga) sin(Omiga) 0; -sin(Omiga) cos(Omiga) 0; 0 0 1];
	
	Q = q1 * q2 * q3;
	
	r = Q' * rpqw;
	v = Q' * vpqw;
	
	y(1) = rpqw(1);
	y(2) = rpqw(2);
	y(3) = rpqw(3);

	y(4) = vpqw(1);
	y(5) = vpqw(2);
	y(6) = vpqw(3);

	y(7) = r(1);
	y(8) = r(2);
	y(9) = r(3);
	
	y(10) = v(1);
	y(11) = v(2);
	y(12) = v(3);
end
