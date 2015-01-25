---
title: Functions
---
## M-file functions

~~~matlab
function [out1, out2, out3] = dummyfunction(in1, in2, in3)
%DUMMYFUNCTION Does nothing :).
%    DUMMYFUNCTION() does nothing.
%
%    DUMMYFUNCTION(in1, in2, in3) also does nothing.
%
%    See also ZEROS, ONES, EYE.

% ...
end
~~~

### Rules

- The function name is actually the **filename**. The name from the first line in the file is just ignored. (It is better to be identical, of course.)
- Function names are case sensitive on \*nix, and **were** case insensitive on Windows. So it is better to use only lowercase letters for portability. One can use underscore, but conventionally it is seldom used.
- ![Function help text]({{ site.imagesurl }}/function-help-text.png){:.pull-right .img-thumbnail} The first contiguous lines of comments are the help text.

### Input and output arguments

- Functions can have any number of input and output arguments (include zero).
- Functions can be called with an **equal or fewer** number of input and output arguments.
- The information about the number of input and output arguments can be known by callee function by using `nargin` and `nargout`.

~~~matlab
function [x, y, z, varargout] = argexample(x, a, b, varargin)

fprintf('nargin = %d, nargout = %d\n', nargin(), nargout());

if nargin() < 3 % ~exist('b', 'var')
  b = -3;
  if nargin() < 2 % ~exist('a', 'var')
    a = -2;
    if nargin() < 1 % ~exist('x', 'var')
      x = -1;
    end
  end
end

if nargout() == 2
  y = [a b];
else
  y = a;
  z = b;
end

varargout = varargin(end:-1:1);

end
~~~

~~~plain
>> argexample()
nargin = 0, nargout = 0
ans =
    -1
>> disp(argexample())
nargin = 0, nargout = 1
    -1
>> x = argexample()
nargin = 0, nargout = 1
x =
    -1
>> x = argexample(1)
nargin = 1, nargout = 1
x =
     1
>> [x, y] = argexample()
nargin = 0, nargout = 2
x =
    -1
y =
    -2    -3
>> [x, y, z] = argexample(1, 2)
nargin = 2, nargout = 3
x =
     1
y =
     2
z =
    -3
>> [~, ~, ~, c1, c2, ~, c4] = argexample(0, 0, 0, 1, 2, 3, 4)
nargin = 7, nargout = 7
c1 =
     4
c2 =
     3
c4 =
     1
~~~

### Function workspaces

Functions have their own workspace. Any variables created by the function are hidden from any other functions.

{:.alert .alert-info}
There are `global` and `persistent` variables, and `eval`- related functions, but the use of these types are usually discouraged.

## Local functions (subfunctions)

Several functions can be in a single file. Any additional functions other than first one are subfunctions, and can be called only by the functions in the same file.

## Anonymous functions and function handles

One can create functions in a statement without having m-file.

~~~plain
>> fplus = @(x, y) x + y;
>> feval(fplus, 1, 2)
ans =
     3
>> fplus(1, 2)
ans =
     3
>> functions(fplus)
ans = 
     function: '@(x,y)x+y'
         type: 'anonymous'
         file: ''
    workspace: {[1x1 struct]}
~~~

{:.alert .alert-warning}
The function `inline` (introduced in MATLAB 5) is obsolete and will be removed in a future release.

The anonymous function **captures and hold** a snapshot of variables at the time it is declared.

~~~plain
>> x = 1; c = 2;
>> % Below: `x` is local in an anonymous function and `c` will be captured.
>> f = @(x, a, b) a * x + b + c;
>> f(2, 10, 3) % 10 * 2 + 3 + c == 10 * 2 + 3 + 2
ans =
    25
>> c = 5;
>> f(2, 10, 3)
ans =
    25
>> s = functions(f)
s = 
     function: '@(x,a,b)a*x+b+c'
         type: 'anonymous'
         file: ''
    workspace: {[1x1 struct]}
>> s.workspace{1}
ans = 
    c: 2
~~~

There are some situations when the (identity of the) function must be passed to another functions. By creating function handle, one can save the identity of a function to a variable. As a matter of fact, `fplus` above is already a function handle of the anonymous function.

~~~plain
>> myfeval = @(f, x) f(x)
myfeval = 
    @(f,x)f(x)
>> mysin = @sin;
>> myfeval(mysin, pi / 6)
ans =
          0.5
>> myfeval(@sin, pi / 6)
ans =
          0.5
~~~

One can save several function handles in cell arrays.

~~~plain
>> fs = {@cos, @sin, @tan}
fs = 
    @cos    @sin    @tan
>> fs{1}(pi / 6)
ans =
      0.86603
>> fs{2}(pi / 6)
ans =
          0.5
>> fs{3}(pi / 6)
ans =
      0.57735
~~~

### Example: Solving ODE

$$
  \begin{align*}
    \frac{\mathrm{d}R}{\mathrm{d}t} &= a_R R + p_R J, \\
    \frac{\mathrm{d}J}{\mathrm{d}t} &= p_J R + a_J J .
  \end{align*}
$$

~~~matlab
% functionexample.m
tspan = [0 50];
y0 = [1; 1];

odefunrj = @(t, y) [-0.1 -1; 0.6 -0.2] * y;
[T1, Y1] = ode45(odefunrj, tspan, y0);

odefunrj = @(t, y) [-0.3 0.2; -0.7 0.3] * y;
[T2, Y2] = ode45(odefunrj, tspan, y0);

[T3, Y3] = ode45(@odefunrj2, tspan, y0);

L = [-0.3 0.2; -0.7 0.3];
[T4, Y4] = ode45(@(t, y) odefunrj2(t, y, L), tspan, y0);
~~~

~~~matlab
function dy = odefunrj2(~, y, L)
if nargin < 3
  L = [-0.1 -1; 0.6 -0.2];
end
dy = L * y;
end
~~~
