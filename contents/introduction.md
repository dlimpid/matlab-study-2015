---
title: Introduction
---
From [MathWorks](http://www.mathworks.com/products/matlab/):

> MATLAB<sup>®</sup> is the high-level language and interactive environment used by millions of engineers and scientists worldwide.

From [Wikipedia](http://en.wikipedia.org/wiki/MATLAB):

> MATLAB (**mat**rix **lab**oratory) is a multi-paradigm numerical computing environment and fourth-generation programming language. Developed by MathWorks, MATLAB allows matrix manipulations, plotting of functions and data, implementation of algorithms, creation of user interfaces, and interfacing with programs written in other languages, including C, C++, Java, Fortran and Python.

## MATLAB as a Calculator

~~~plain
>> 42 + 4 * 2
ans =
    50
>> 10 - 2^3
ans =
     2
>> 3 / 2 + 21 \ 42
ans =
          3.5
~~~

## Variables

### Naming Rules

Same as C/C++ and most programming languages, except that it cannot start with underscore.

- Case sensitive

  ~~~plain
  >> cost = 1; Cost = 2; COST = 3; cOsT = 4;
  >> cost, Cost, COST, cOsT
  cost =
       1
  Cost =
       2
  COST =
       3
  cOsT =
       4
  ~~~

- Start with letter, followed by letters, digits, underscores
    
  ~~~plain
  >> this_is_a_valid_variable_name_42_foo_bar______ = 42
  this_is_a_valid_variable_name_42_foo_bar______ =
      42
  >> _this_is_not = 42 % it is valid in C/C++ but not in MATLAB
   _this_is_not = 42
   |
  Error: The input character is not valid in MATLAB statements or expressions.
  ~~~

### Keywords and Special Variables

Keywords cannot be used as variable names: `for`, `end`, `while`, `continue`, `break`, `if`, `elseif`, `else`, `switch`, `case`, `otherwise`, `function`, `return`, `try`, `catch`, `global`, `persistent`

Special variables: `ans`, `pi`, `eps`, `inf`, `NaN` (`nan`), `i`, `j`, `nargin`, `nargout`, `varargin`, `varargout`, ⋯

{:.alert .alert-warning}
Please do not overwrite these variables even though you can!

~~~plain
>> [sin(pi / 3), sqrt(3)/2]
ans =
      0.86603      0.86603
>> pi = 3;
>> [sin(pi / 3), sqrt(3)/2]
ans =
      0.84147      0.86603
>> clear pi
>> [sin(pi / 3), sqrt(3)/2]
ans =
      0.86603      0.86603
~~~

{:.alert .alert-warning}
For C/C++ users: Do not use `i` or `j` as loop variables!
Moreover, you can always use `1i` or `2.0j` rather than `i` or `2.0 * j`.

~~~plain
>> [1 + i, complex(1, 1), 1 + 1i]
ans =
  Columns 1 through 2
            1 +          1i            1 +          1i
  Column 3
            1 +          1i
>> for i = 1:10
     % do something...
   end
>> i
i =
    10
>> [1 + i, complex(1, 1), 1 + 1i]
ans =
  Columns 1 through 2
           11 +          0i            1 +          1i
  Column 3
            1 +          1i
~~~


## Script M-Files

You can save any commands in a file and evaluate them.
The effect is exactly the same as that it is typed at the Command Window.

[scriptexample.m]({{ site.githubfileurl }}/scriptexample.m)

~~~matlab
% scriptexample.m
clear;

a = 1;
b = 2
c = 3;
~~~

~~~plain
>> scriptexample
b =
     2
~~~

### Base Workspace

The data (variables) created in the Command Window live in the *Base workspace*.

~~~plain
>> a = 1; b = 2; c = 3; d = 4;
>> whos
  Name      Size            Bytes  Class     Attributes

  a         1x1                 8  double              
  b         1x1                 8  double              
  c         1x1                 8  double              
  d         1x1                 8  double              

>> clear b d;
>> whos
  Name      Size            Bytes  Class     Attributes

  a         1x1                 8  double              
  c         1x1                 8  double              

>> clear
>> whos
>> 
~~~
