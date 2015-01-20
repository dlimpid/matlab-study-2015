---
title: Data types
---
## Numeric data types

### Integers

{:.alert .alert-info}
Integer data types are seldom used in MATLAB.

In almost every case, the number is double precision be default.

~~~plain
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

~~~plain
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

They Conforms [IEEE standard](http://en.wikipedia.org/wiki/IEEE_floating_point).

~~~plain
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


## Strings

Strings are arrays of integers (ASCII characters) a little special. Single quotes are used for strings. (Octave also supports double quotes.)

~~~plain
>> s = 'Hello!'
s =
Hello!
>> ['H' 'e' 'l' 'l' 'o' '!']
ans =
Hello!
>> class(s)
ans =
char
>> numel(s)
ans =
     6
~~~

Since strings are basically arrays, they can be manipulated with all array manipulation operators or functions.

~~~plain
>> s = 'The quick brown fox jumps over the lazy dog';
>> s(2:2:end)
ans =
h uc rw o up vrtelz o
>> s(end:-1:1)
ans =
god yzal eht revo spmuj xof nworb kciuq ehT
>> ['The', ' ', 'quick', ' brown']
ans =
The quick brown
~~~

Any arithmetic operations on string will convert the string into numbers.

~~~plain
>> double('abcdef')
ans =
    97    98    99   100   101   102
>> 'abcdef' - 'a'
ans =
     0     1     2     3     4     5
>> 2 * 'abcdef'
ans =
   194   196   198   200   202   204
>> char('abcdef' + ('A' - 'a'))
ans =
ABCDEF
~~~


## Cell arrays

Each cell in a cell array can hold *any* data type, may be different each other.
The major usage of cell arrays is for saving several strings or several arrays of different size.

~~~
>> ['fisrt string'; 'second string']
Error using vertcat
Dimensions of matrices being concatenated are not consistent. 
>> {'first string', 'second string'}
ans = 
    'first string'    'second string'
>> {zeros(4, 2), ones(7, 9)}
ans = 
    [4x2 double]    [7x9 double]
>> c1 = {@sin, @cos}
c1 = 
    @sin    @cos
>> c2 = {'Hello', @tan, rand(10), [], {'another cell'}}
c2 = 
    'Hello'    @tan    [10x10 double]    []    {1x1 cell}
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

Structures are like cell arrays but using field names instead of number.

~~~plain
>> student.name = 'Gildong Hong'
student = 
    name: 'Gildong Hong'
>> student.age = 20; student.gpa = 3.6; student.dept = 'Mathematics'
student = 
    name: 'Gildong Hong'
     age: 20
     gpa: 3.6
    dept: 'Mathematics'
~~~

In fact, structure also is an array.

~~~plain
>> student(2) = struct('name', 'Cheolsu Lee', 'age', 21, 'gpa', 3.7, 'dept', 'Computer science and engineering')
student = 
1x2 struct array with fields:
    name
    age
    gpa
    dept
>> student.name % comma-separated list
ans =
Gildong Hong
ans =
Cheolsu Lee
>> {student.name}
ans = 
    'Gildong Hong'    'Cheolsu Lee'
>> [student.age]
ans =
    20    21
~~~
