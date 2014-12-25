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

	omigadot(1) = (M(1) + (I(2) - I(3)) * omiga(3) * omiga(2)) / I(1);
	omigadot(2) = (M(2) + (I(3) - I(1)) * omiga(1) * omiga(3)) / I(2);
	omigadot(3) = (M(3) + (I(1) - I(2)) * omiga(2) * omiga(1)) / I(3);
end
