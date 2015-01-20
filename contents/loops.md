---
title: Loops
---
## While loops

Syntax:

~~~matlab
while expression
  statements
end
~~~
Statements between `while` and `end` are excuted while (as long as) `expression` is true.

## For loops

Syntax:

~~~matlab
for x = values
  statements
  ...
end
~~~

Statements between `for` and `end` are excuted for every **column** in `values`. In most cases, `values` are row vectors. It is roughly the same as

~~~matlab
temp = values;
k = 1;
while k <= size(temp, 2)
  x = temp(:, k);

  statements
  ...

  k = k + 1;
end
~~~

Examples:

~~~matlab
x = 0:0.1:10;
y = zeros(size(x));
for k = 1:numel(x)
  y(k) = sin(x(k));
end
~~~

~~~matlab
M = [1 2 3 4; 5 6 7 8];
for x = M
  % x is a column of a matrix M
  disp(sum(x));
end % => results are 6, 8, 10, 12
~~~

The expression for loop values is evaluated **only once**, and cannot be changed.
