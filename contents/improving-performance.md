---
title: Improving Performance
---
# {{ page.title }}

## General Tips

- Functions are generally faster than scripts.
- Split large scripts or functions into smaller ones.
- Do not overload any built-in functions or special variables.
- Do not change the class of the variable.

## Preallocation

~~~matlab
clear();

n = 1000000;

tic();
x = [];
for k = 1:n
  x(k) = sin(k);
end
toc(); % => Elapsed time is 0.484674 seconds.

clear x k;
tic();
x = zeros(1, n);
for k = 1:n
  x(k) = sin(k);
end
toc(); % => Elapsed time is 0.071869 seconds.
~~~
