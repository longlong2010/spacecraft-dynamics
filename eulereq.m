function omigadot = eulereq(omiga, I, M)
	omigadot = zeros(3, 1);
	omigadot(1) = (M(1) + (I(2) - I(3)) * omiga(2) * omiga(3)) / I(1);
	omigadot(2) = (M(2) + (I(3) - I(1)) * omiga(1) * omiga(3)) / I(2);
	omigadot(3) = (M(3) + (I(1) - I(2)) * omiga(1) * omiga(2)) / I(3);
end
