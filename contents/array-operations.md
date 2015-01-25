---
title: Array operations
---
## Arithmatic operations

### Matrix operations

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

{:.alert .alert-info}
MATLAB does not have compound assignment operators, such as `+=` and `*=`. One should use `x = x + 1` rather than `x += 1` or `++x`.


### Element-wise operations

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


## Relational and logical operations

### Relational operators

~~~plain
>> x = 1:3;
>> x > 2
ans =
     0     0     1
>> x >= 2
ans =
     0     1     1
>> x < 2
ans =
     1     0     0
>> x <= 2
ans =
     1     1     0
>> x == 2
ans =
     0     1     0
>> x ~= 2
ans =
     1     0     1
~~~

{:.alert .alert-info}
Note that all the above results are `logical`, not floating point (`double`) or integers.

### Logical operators

~~~plain
>> a = [false false true true];
>> b = [false true false true];
>> a & b
ans =
     0     0     0     1
>> a | b
ans =
     0     1     1     1
>> ~a
ans =
     1     1     0     0
~~~

{:.alert .alert-warning}
Negation and “not equal to” operators are `~` and `~=`, not `!`.

Operators `&&` and `||` are only for scalars, and short-circuit operators.

~~~matlab
function shortcircuitexample()
disp('true || f(true)');
disp(true || f(true)); % short-circuiting

disp('false || f(true)');
disp(false || f(true));

disp('true && f(false)');
disp(true && f(false));

disp('false && f(false)');
disp(false && f(false)); % short-circuiting
end

function b = f(b)
disp('f() is called.');
end
~~~

~~~plain
>> shortcircuitexample
true || f(true)
     1
false || f(true)
f() is called.
     1
true && f(false)
f() is called.
     0
false && f(false)
     0
~~~


## Scalar expansion

The scalar value is automatically expanded to array the same size as the other side of the operator, and operators are evaluated as element-wise sense.

~~~plain
>> [1 2; 3 4] + 1 % == [1 2; 3 4] + [1 1; 1 1]
ans =
     2     3
     4     5
>> x = rand(1, 5)
x =
      0.04644      0.93959      0.31257         0.34      0.44658
>> x > 0.5 % == x > [0.5 0.5 0.5 0.5 0.5]
ans =
     0     1     0     0     0
>> 2 * [1 2 3; 4 5 6] % == [2 2 2; 2 2 2] .* [1 2 3; 4 5 6]
ans =
     2     4     6
     8    10    12
>> [1 2 3; 4 5 6] / 2 % == [1 2 3; 4 5 6] ./ [2 2 2; 2 2 2]
ans =
          0.5            1          1.5
            2          2.5            3
~~~


{:.alert .alert-warning}
`Matrix / scalar` works but `scalar / Matrix` not. Consider about `10 / [2; 5]`.


## Operator precedence

Operators have precedence, almost the same with “normal math.”

{:.alert .alert-warning}
All binary operators of equal precedence are evaluated left to right, even **power**.

~~~plain
>> 1 + 2^2 * 3^2 / 6 - 5 % == (1 + (((2^2) * (3^2)) / 6)) - 5
ans =
     2
>> [3^2^3, (3^2)^3, 3^(2^3)] % left to right!
ans =
         729         729        6561
~~~

1.  (Highest) `()` 
2.  `.'`, `.^`, `'`, `^`
3.  `+` (unary), `-` (unary), `~`
4.  `.*`, `./`, `.\`, `*`, `/`, `\`
5.  `+` (binary), `-` (binary)
6.  `:`
7.  `<`, `<=`, `>`, `>=`, `==`, `~=`
8.  `&`
9.  `|`
10. `&&`
11. (Lowest) `||`


## Appendix

What do you think of the below expressions? (Note that MATLAB does not have `--` operator.)

~~~plain
>> 1 - 2
ans =
    -1
>> 1 -- 2
ans =
     3
>> 1 --- 2
ans =
    -1
>> [1 - 2]
ans =
    -1
>> [1 -2]
ans =
     1    -2
>> [1 --- 2]
ans =
     1    -2
>> [1 ---2]
ans =
     1    -2
>> [1 - - - 2]
ans =
    -1
~~~
