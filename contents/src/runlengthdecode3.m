function y = runlengthdecode3(x, r)

cR = cumsum(r);
inc = zeros(1, cR(end));
inc([1 cR(1:(end - 1)) + 1]) = 1;
ind = cumsum(inc);
y = x(ind);
end

