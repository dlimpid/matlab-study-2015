function y = runlengthdecode1(x, r)

y = [];
for k = 1:numel(x)
  y = [y x(k) + zeros(1, r(k))];
end
end

