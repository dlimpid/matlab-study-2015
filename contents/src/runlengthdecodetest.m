function runlengthdecodetest(nx, maxR, nevals)

if nargin < 3
  nevals = 10000;
end

x = randperm(nx);
r = randi(maxR, size(x));

tic();
for k = 1:nevals
  y = runlengthdecode1(x, r);
end
toc();
clear k y;

tic();
for k = 1:nevals
  y = runlengthdecode2(x, r);
end
toc();
clear k y;

tic();
for k = 1:nevals
  y = runlengthdecode3(x, r);
end
toc();

end
