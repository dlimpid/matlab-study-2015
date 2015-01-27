---
title: Improving performance
---
## General tips

- Functions are generally faster than scripts.
- Split large scripts or functions into smaller ones.
- Do not overload any built-in functions or special variables.
- Do not change the class of the variable.


## Preallocation

~~~matlab
clear();

n = 10000000;

tic();
x = [];
for k = 1:n
  x(k) = sin(k);
end
toc(); % => Elapsed time is 5.311631 seconds.

clear x k;
tic();
x = zeros(1, n);
for k = 1:n
  x(k) = sin(k);
end
toc(); % => Elapsed time is 1.971644 seconds.
~~~


## Vectorization

~~~matlab
clear();
tic();
x = sin(1:n);
toc(); % => Elapsed time is 1.172200 seconds.
~~~

### List of functions often used for vectorization

`all`
: True if all elements of a vector are true (nonzero)

`any`
: True if any elements of a vector are true (nonzero)

`sum`, `cumsum`
: Sum and cumulative sum of elements in a vector

`prod`, `cumprod`
: Sum and cumulative sum of elements in a vector

`find`
: Find indices where the elements are nonzero

`reshape`
: Reshape an array

`repmat`
: Replicate an array

`ind2sub`, `sub2ind`
: Convert between linear indices and subscripts

### Example: [Run-length decoding](http://en.wikipedia.org/wiki/Run-length_encoding)

First (ugly) implementation:

~~~matlab
function y = runlengthdecode1(x, r)

y = [];
for k = 1:numel(x)
  y = [y x(k) + zeros(1, r(k))];
end
end
~~~

~~~plain
>> runlengthdecode1([42 0 3 7], [4 2 1 3])
ans =
    42    42    42    42     0     0     3     7     7     7
~~~

Preallocation:

~~~matlab
function y = runlengthdecode2(x, r)

y = zeros(1, sum(r));

ind = 1;
for k = 1:numel(x)
  y(ind:(ind + r(k) - 1)) = x(k);
  ind = ind + r(k);
end
end
~~~

Vectorization:

~~~matlab
function y = runlengthdecode3(x, r)

cR = cumsum(r);
inc = zeros(1, cR(end));
inc([1 cR(1:(end - 1)) + 1]) = 1;
ind = cumsum(inc);
y = x(ind);
end
~~~

Test:

~~~matlab
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
~~~

~~~plain
>> runlengthdecodetest(200, 100)
Elapsed time is 6.191004 seconds.
Elapsed time is 3.630533 seconds.
Elapsed time is 1.209952 seconds.
>> runlengthdecodetest(1000, 20)
Elapsed time is 27.902129 seconds.
Elapsed time is 15.252254 seconds.
Elapsed time is 1.496761 seconds.
>> runlengthdecodetest(2000, 10)
Elapsed time is 52.159993 seconds.
Elapsed time is 29.201567 seconds.
Elapsed time is 1.585380 seconds.
~~~


## Profiling

- `tic` and `toc`
- **Editor** > **Breakpoints**.
- `mlint`, `mlintrpt`
- [Cyclomatic complexity](http://en.wikipedia.org/wiki/Cyclomatic_complexity): `checkcode` with `-cyc` option. If the complexity of a function exceeded 10, consider dividing a function into smaller ones or code refactoring unless there are reasons it should be complex.
- Profiler
