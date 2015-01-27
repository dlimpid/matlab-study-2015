function y = runlengthdecode2(x, r)

y = zeros(1, sum(r));

ind = 1;
for k = 1:numel(x)
  y(ind:(ind + r(k) - 1)) = x(k);
  ind = ind + r(k);
end
end

