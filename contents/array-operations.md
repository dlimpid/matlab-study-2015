---
title: Array Operations
---
## Array Operations

### Matrix Operations

{:.alert .alert-info}
You can search documentation with the keywords *arithmetic*, *operators*, or name of each operators.

- Plus and minus (`plus` and `minus`)

  ~~~plain
  >> A = [1 2 3; 4 5 6]; B = [10 10 10; 20 20 20];
  >> A + B
  ans =
      11    12    13
      24    25    26
  >> A - B
  ans =
      -9    -8    -7
     -16   -15   -14
  ~~~

- Matrix multiplication (`mtimes`)
  
  ~~~plain
  >> A = [1 2; 3 4; 5 6], B = [1 0; 2 1], A * B
  A =
       1     2
       3     4
       5     6
  B =
       1     0
       2     1
  ans =
       5     2
      11     4
      17     6
  ~~~

- “Matrix division” (linear system solver, `mldivide` and `mrdivide`)

  - `A * x = b` &rArr; `x = A \ b`
  - `y * A = b` &rArr; `y = b / A`

  ~~~plain
  >> A = [1 2; 3 4]; b = [4; 10];
  >> A \ b, inv(A) * b
  ans =
              2
              1
  ans =
       2
       1
  >> A * [2; 1]
  ans =
       4
      10
  ~~~

- Matrix power (`mpower`)

  ~~~plain
  >> A = [1 2; 3 4]; 
  >> A * A * A * A, A^4
  ans =
     199   290
     435   634
  ans =
     199   290
     435   634
  ~~~


### Element-wise Operations

- Element-wise multiplication (`times`) and division (`ldivide` and `rdivide`)

  ~~~plain
  >> A = [1 2 3; 4 5 6]; B = [2 2 2; 3 3 3];
  >> A .* B
  ans =
       2     4     6
      12    15    18
  >> A * B
  Error using  * 
  Inner matrix dimensions must agree. 
  >> A ./ B
  ans =
            0.5            1          1.5
         1.3333       1.6667            2
  >> B .\ A
  ans =
            0.5            1          1.5
         1.3333       1.6667            2
  ~~~

- Element-wise power (`power`)

  ~~~plain
  >> A = [1 2 3; 4 5 6];
  >> A.^3
  ans =
       1     8    27
      64   125   216
  >> A^3
  Error using  ^ 
  Inputs must be a scalar and a square matrix.
  To compute elementwise POWER, use POWER (.^) instead. 
  ~~~


### Operator Precedence

Operators have precedence, almost the same with “normal math.”

{:.alert .alert-warning}
All equal precedence are evaluated left to right, even **power**.

~~~plain
>> 1 + 2^2 * 3^2 / 6 - 5 % == (1 + (((2^2) * (3^2)) / 6)) - 5
ans =
     2
>> [3^2^3, (3^2)^3, 3^(2^3)] % left to right!
ans =
         729         729        6561
~~~

1.  `()` (Highest)
2.  `.'`, `.^`, `'`, `^`
3.  `+` (unary), `-` (unary), `~`
4.  `.*`, `./`, `.\`, `*`, `/`, `\`
5.  `+` (binary), `-` (binary)
6.  `:` (Lowest)


{::comment}
TODO

### Scalar Expansion

{:.alert .alert-warning}
`Matrix / scalar` works but `scalar / Matrix` not.


### Relational Operators


### ??
`arrayfun`, `bsxfun`.
{:/comment}
