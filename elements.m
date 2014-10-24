function y = elements(r, v)
	mu = 398600;

	y = zeros(6, 1);

	lr = normest(r);
	lv = normest(v);
	vr = dot(v, r) / lr;

	h = cross(r, v);
	lh = normest(h);

	i = acos(h(3) / lh);

	k = [0; 0; 1];
	n = cross(k, h);
	ln = normest(n);
	if n(2) >= 0
		Omiga = acos(n(1) / ln);
	else
		Omiga = 2 * pi - acos(n(1) / ln);
    end
    
	e = ((lv^2 - mu / lr) * r - dot(r, v) * v) / mu;
	le = normest(e);
	if e(3) >= 0
		omiga = acos(dot(n, e) / (ln * le));
	else
		omiga = 2 * pi - acos(dot(n, e) / (ln * le));
    end

	if vr >= 0
		theta = acos(dot(e, r) / (le * lr));
	else
		theta = 2 * pi - acos(dot(e, r) / (le * lr));
    end
	rp = (lh^2 / mu) * (1 / (1 + le));
	ra = (lh^2 / mu) * (1 / (1 - le));

	a = (rp + ra) / 2;

	y(1) = a;
	y(2) = le;
	y(3) = i * 180 / pi;
	y(4) = Omiga * 180 / pi;
	y(5) = omiga * 180 / pi;
	y(6) = theta * 180 / pi;
end
