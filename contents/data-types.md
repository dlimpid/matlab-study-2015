---
title: Data types
---
## Numeric data types

### Integers

{:.bg-info}
Integer data types are seldom used in MATLAB.

In almost every case, the number is double precision be default.

~~~
>> x = 1:5 % double precision
x =
     1     2     3     4     5
>> class(x)
ans =
double
>> x2 = int32(x) % 32-bit integer, same as `int` in C (in most case)
x2 =
           1           2           3           4           5
>> class(x2)
ans =
int32
>> class(ones(2, 4)) % double precision
ans =
double
>> class(ones(2, 4, 'uint64'))
ans =
uint64
~~~

### Floating-point numbers

The default data type is [double precision](http://en.wikipedia.org/wiki/Double-precision_floating-point_format).

~~~
>> realmin
ans =
  2.2251e-308
>> realmin() % == realmin('double')
ans =
  2.2251e-308
>> realmax() % == realmax('double')
ans =
  1.7977e+308
>> eps() % == eps(1) == eps('double')
ans =
   2.2204e-16
>> 1 + eps() == 1
ans =
     0
>> 1 + eps() / 2 == 1
ans =
     1
~~~

Conforms [IEEE standard](http://en.wikipedia.org/wiki/IEEE_floating_point).

~~~
>> format bit; % Octave only
>> 0, +0, -0, Inf, -Inf, NaN
ans = 0000000000000000000000000000000000000000000000000000000000000000
ans = 0000000000000000000000000000000000000000000000000000000000000000
ans = 1000000000000000000000000000000000000000000000000000000000000000
ans = 0111111111110000000000000000000000000000000000000000000000000000
ans = 1111111111110000000000000000000000000000000000000000000000000000
ans = 0111111111111000000000000000000000000000000000000000000000000000
>> 0 == -0
ans =
     1
>> Inf == Inf
ans =
     1
>> NaN == NaN
ans =
     0
~~~

| `==`   | `0` | `-0` | `Inf` | `-Inf` | `NaN` |
| `0`    | T   | T    | F     | F      | F     |
| `-0`   | T   | T    | F     | F      | F     |
| `Inf`  | F   | F    | T     | F      | F     |
| `-Inf` | F   | F    | F     | T      | F     |
| `NaN`  | F   | F    | F     | F      | F     |
{:.table}

## Strings

Strings are arrays of numerical data a little special.

TODO

## Cell arrays

Each cell in a cell array can hold *any* data type, may be different each other.
The major usage of cell arrays is for saving several strings or several arrays of different (unknown) size.

~~~
>> ['fisrt string'; 'second string']
Error using vertcat
Dimensions of matrices being concatenated are not consistent. 
>> {'first string', 'second string'}
ans = 
    'first string'    'second string'
>> {zeros(randi(10, [1 2])), ones(randi(10, [1 2]))}
ans = 
    [4x2 double]    [7x9 double]
~~~

### Cell indexing and content addressing

~~~
>> c = {1, 1:2; 1:3, 1:4}
c = 
    [         1]    [1x2 double]
    [1x3 double]    [1x4 double]
>> c(4)
ans = 
    [1x4 double]
>> class(ans)
ans =
cell
>> c{4}
ans =
     1     2     3     4
>> class(ans)
ans =
double
~~~

## Structures

TODO

## Advanced: comma-separated lists 

TODO
