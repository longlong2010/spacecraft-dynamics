function omigadot = euler5(t, omiga, flag, I)
	omigadot = zeros(3, 1);
	M = zeros(3, 1);
	
	T = 2 * pi / 6;
	n = t / T;
    
	if n < 10 && n - floor(n) < (0.05 / T)
		M(1) = 6;
    else
        M(1) = 0;
	end
	
	omigadot = eulereq(omiga, I, M);
end
