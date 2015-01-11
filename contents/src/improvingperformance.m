%% Preallocation
clear();

n = 10000000;

tic();
x = [];
for k = 1:n
  x(k) = sin(k);
end
toc();

clear x k;
tic();
x = zeros(1, n);
for k = 1:n
  x(k) = sin(k);
end
toc();
