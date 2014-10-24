function y = newton(f, f1, x, error)
	y = x;
	while 1
    	F = f(y);
		F1 = f1(y);
		diff = F / F1;
		y = y - diff;

		if abs(diff) <= error 
			break;
	end
end
