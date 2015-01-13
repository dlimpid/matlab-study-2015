---
title: Array Construction and Indexing
---
## Array Creation (by Hand)

`[]`
: Array concatenation

`,` or spaces
: Horizontal concatenation

`;`
: Vertical concatenation

{:.alert .alert-warning}
When there are operators in `[]`, spaces after the operator is critical!
It's advisable to use parentheses and commas if you're not sure.

~~~plain
>> x = [0, 1, 2, 3, 4]
x =
     0     1     2     3     4
>> y = [0 1 2 3 4]
y =
     0     1     2     3     4
>> z = [0 1 +2 3 + 4] % [1 +2] => [1 2], [3 + 4] => [7]
z =
     0     1     2     7
>> z = [0+1 +2 3 + 4] % [0+1] => [1]
z =
     1     2     7
>> w = [(0+1 +2) 3, + 4]
w =
     3     3     4
~~~

All rows should have the same number of columns.

~~~plain
>> A = [1, 2; 3, 4]
A =
     1     2
     3     4
>> B = [1 2; 3 4]
B =
     1     2
     3     4
>> C = [1 2; 3 4 5]
Error using vertcat
Dimensions of matrices being concatenated are not consistent. 
~~~

## Array Construction

### Colon Operator (`:`) and `linspace`

{:.alert .alert-info}
Search Help with the keyword “colon.”

`s:inc:e` is **roughly** the same as `[s, s + 1 * inc, s + 2 * inc, ... s + k * inc]`, where `k` is the largest integer satisfying `s + k * inc <= e` when `inc > 0` and `s + k * inc >= e` when `inc > 0`.

~~~plain
>> 1:10
ans =
     1     2     3     4     5     6     7     8     9    10
>> 1:3:10
ans =
     1     4     7    10
>> 1:3:9
ans =
     1     4     7
>> 10:-3:0
ans =
    10     7     4     1
~~~

You don't need to worry about round-off error of floating-point arithmetic. (Visit [here](http://kr.mathworks.com/matlabcentral/answers/143255-how-does-the-colon-operator-work) for more details.)

~~~plain
>> 0:0.1:0.3 % Don't worry, it works!
ans =
            0          0.1          0.2          0.3
>> % even though
>> fprintf('%d, %d, %d\n', 0.1 + 0.1 <= 0.2, ...
     0.1 + 0.1 + 0.1 <= 0.3, 0.1 + 0.1 + 0.1 + 0.1 <= 0.4)
1, 0, 1
>> s = 0; while s <= 0.2; display(s); s = s + 0.1; end
s =
     0
s =
          0.1
s =
          0.2
>> s = 0; while s <= 0.3; display(s); s = s + 0.1; end
s =
     0
s =
          0.1
s =
          0.2
>> s = 0; while s <= 0.4; display(s); s = s + 0.1; end
s =
     0
s =
          0.1
s =
          0.2
s =
          0.3
s =
          0.4
~~~

`linspace(s, e, k)` returns a row vector of `k` points linearly spaced from `s` to `e`.

~~~plain
>> linspace(0, 1, 5)
ans =
            0         0.25          0.5         0.75            1
>> linspace(0.7, 0.2, 4)
ans =
          0.7      0.53333      0.36667          0.2
~~~

### Standard Arrays

`zeros(n)` or `zeros(m, n)` or `zeros([m n])`
: returns `n` by `n` or `m` by `n` matrix of all zeros

`ones`
: matrix of all ones

`eye`
: identity matrix

`rand`
: standard uniform distribution on $$(0, 1)$$.

~~~plain
>> zeros(3)
ans =
     0     0     0
     0     0     0
     0     0     0
>> ones(3, 4)
ans =
     1     1     1     1
     1     1     1     1
     1     1     1     1
>> eye(3)
ans =
     1     0     0
     0     1     0
     0     0     1
>> eye([2 5])
ans =
     1     0     0     0     0
     0     1     0     0     0
>> rand(3, 4)
ans =
      0.95031      0.56284      0.30193      0.86701
      0.90071       0.7448      0.40683      0.22233
      0.83808      0.53536      0.92221      0.45245
~~~

See also `NaN`, `Inf`, `diag`, `true`, `false`, and `randn`.

## Array Concatenation (Again)

~~~plain
>> a = [1 2; 3 4]; b = [5; 6]; c = [7 8 9];
>> [a b; c]
ans =
     1     2     5
     3     4     6
     7     8     9
~~~

## Array Indexing

For vectors:

~~~plain
>> x = 0.1:0.1:1;
>> x(3)
ans =
          0.3
>> x(7)
ans =
          0.7
>> x(4:7) % == x([4 5 6 7])
ans =
          0.4          0.5          0.6          0.7
>> x(8:end) % == x([8 9 10])
ans =
          0.8          0.9            1
>> x(1:2:end) % == x([1 3 5 7 9])
ans =
          0.1          0.3          0.5          0.7          0.9
>> x(1:2:end)(3:end) % Octave only; syntax error in MATLAB
ans =

         0.5         0.7         0.9
~~~

### Subscripts

~~~plain
>> A = [0.1 0.2 0.3 0.4; 0.5 0.6 0.7 0.8; 0.9 1.0 1.1 1.2]
A =
          0.1          0.2          0.3          0.4
          0.5          0.6          0.7          0.8
          0.9            1          1.1          1.2
>> A(2, 3)
ans =
          0.7
>> A(3, 1)
ans =
          0.9
>> A(2:3, 1:2)
ans =
          0.5          0.6
          0.9            1
~~~

### Linear Index

~~~plain
>> A(10)
ans =
          0.4
>> [A(1), A(2), A(3), A(4), A(end)]
ans =
          0.1          0.5          0.9          0.2          1.2
~~~

~~~plain
>> a = reshape(0.1:0.1:1.2, [3 4])
a =
          0.1          0.4          0.7            1
          0.2          0.5          0.8          1.1
          0.3          0.6          0.9          1.2
>> [a(7), a(1, 3)]
ans =
          0.7          0.7
>> sub2ind(size(a), 1, 3)
ans =
     7
>> [r, c] = ind2sub(size(a), 7)
r =
     1
c =
     3
~~~

### Logical Index

The index array should be a **logical** class, not double.

{:.alert .alert-info}
In most cases, you don't need to use `find` function for indexing.

~~~plain
>> x = [5 2 4 7 6 1 8]
x =
     5     2     4     7     6     1     8
>> x > 4
ans =
     1     0     0     1     1     0     1
>> find(x > 4)
ans =
     1     4     5     7
>> x(x > 4)
ans =
     5     7     6     8
>> x([1 0 0 1 1 0 1])
Subscript indices must either be real positive integers or logicals. 
>> x(logical([1 0 0 1 1 0 1]))
ans =
     5     7     6     8
>> x([true false false true true false true])
ans =
     5     7     6     8
>> x(logical([1 1 1 1 1 1 1]))
ans =
     5     2     4     7     6     1     8
>> x([1 1 1 1 1 1 1])
ans =
     5     5     5     5     5     5     5
>> x(find(x > 4)) % overhead!
ans =
     5     7     6     8
~~~
