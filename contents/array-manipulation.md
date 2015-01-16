---
title: Array Manipulation
---
There are many ways to manipulate a (part of) matrix.

Set an element to some value:

~~~plain
>> A = [1 2 3 4; 5 6 7 8; 9 10 11 12]
A =
     1     2     3     4
     5     6     7     8
     9    10    11    12
>> A(1, 1) = 0
A =
     0     2     3     4
     5     6     7     8
     9    10    11    12
>> A(2, 3) = -1
A =
     0     2     3     4
     5     6    -1     8
     9    10    11    12
~~~

Set a submatrix to some values:

~~~plain
>> A = [1 2 3 4; 5 6 7 8; 9 10 11 12];
>> A(2, :) = [42 42 42 42]
A =
     1     2     3     4
    42    42    42    42
     9    10    11    12
>> A(2, :) = [42; 42; 42; 42]; % It works now, but not in old version.
>> A(:, 3) = -1
A =
     1     2    -1     4
    42    42    -1    42
     9    10    -1    12
>> A(2:3, 1:2) = [10 20; 30 40]
A =
     1     2    -1     4
    10    20    -1    42
    30    40    -1    12
~~~

Transpose and conjugate transpose:

~~~plain
>> B = [(1 + 1i) (1 + 2i); (2 + 1i) (2 + 2i)]
B =
            1 +          1i            1 +          2i
            2 +          1i            2 +          2i
>> B'
ans =
            1 -          1i            2 -          1i
            1 -          2i            2 -          2i
>> B.'
ans =
            1 +          1i            2 +          1i
            1 +          2i            2 +          2i
~~~

## Array Manipulation Functions

~~~plain
>> reshape(C, 3, 4)
ans =
     1     4     7    10
     2     5     8    11
     3     6     9    12
>> reshape(C, 2, [])
ans =
     1     3     5     7     9    11
     2     4     6     8    10    12
>> reshape(C, [], 6)
ans =
     1     3     5     7     9    11
     2     4     6     8    10    12
~~~

~~~plain
>> D = [1 2; 3 4];
>> repmat(D, 2, 3) % == [D D D; D D D]
ans =
     1     2     1     2     1     2
     3     4     3     4     3     4
     1     2     1     2     1     2
     3     4     3     4     3     4
~~~

See also `fliplr`, `flipud`, `rot90`, `diag`, `triu`, and `tril`.

## Size of Arrays

~~~plain
>> A = [1 2 3 4; 5 6 7 8];
>> siz = size(A)
siz =
     2     4
>> [r, c] = size(A)
r =
     2
c =
     4
>> [r, ~] = size(A)
r =
     2
>> r = size(A, 1)
r =
     2
>> [~, c] = size(A)
c =
     4
>> size(A, 2)
ans =
     4
~~~

~~~plain
>> A = [1 2 3 4; 5 6 7 8];
>> numel(A)
ans =
     8
>> length(A) % == max(size(A)), when A is not empty.
ans =
     4
>> length(A.')
ans =
     4
>> length(zeros(3, 5, 1, 2, 6, 4))
ans =
     6
~~~

## Delayed Copy

For performance, memory allocation is not done immediately, but done only when it is really needed. It applies to function calls as well.

~~~plain
>> clear();
>> A = zeros(1, 100 * 2^17); % 100 MB
>> memory();
Maximum possible array:     10774 MB (1.130e+10 bytes) *
Memory available for all arrays:     10774 MB (1.130e+10 bytes) *
Memory used by MATLAB:       727 MB (7.625e+08 bytes)
Physical Memory (RAM):      8065 MB (8.457e+09 bytes)

*  Limited by System Memory (physical + swap file) available.
>> B = zeros(1, 100 * 2^17); % 100 MB
>> m = memory(); m.MemUsedMATLAB / 2^20
ans =
        825.9
>> C = A;
>> m = memory(); m.MemUsedMATLAB / 2^20
ans =
        824.5
>> C(1) = 0;
>> m = memory(); m.MemUsedMATLAB / 2^20
ans =
       924.32
~~~

## Excercises

1.  Make the following matrices:

    1.  <span></span>
 
        ~~~matlab
        [1 1 1 1 0 0;
         1 1 1 1 0 0;
         0 0 0 1 1 1;
         0 0 0 1 1 1;
         0 0 0 1 1 1]
        ~~~
 
    2.  <span></span>
 
        ~~~matlab
        [1 1 1 1 0 0;
         1 1 1 1 0 0;
         1 1 1 1 1 1;
         0 0 0 0 1 1;
         0 0 0 0 1 1]
        ~~~

    3.  <span></span>
 
        ~~~matlab
        [ 1  2  3  4  5  6;
          7  8  9 10 11 12;
         13 14 15 16 17 18;
         (...)
         55 56 57 58 59 60]
        ~~~

    4.  <span></span>
 
        ~~~matlab
        [ 1  2  3  4  5  6;
         12 11 10  9  8  7;
         13 14 15 16 17 18;
         24 23 22 21 20 19;
         (...)
         49 50 51 52 53 54;
         60 59 58 57 56 55]
        ~~~
