---
layout: page
title: Introduction
---

# Introduction

From [MathWorks](http://www.mathworks.com/products/matlab/):

> MATLAB<sup>®</sup> is the high-level language and interactive environment used by millions of engineers and scientists worldwide.

From [Wikipedia](http://en.wikipedia.org/wiki/MATLAB):

> MATLAB (**mat**rix **lab**oratory) is a multi-paradigm numerical computing environment and fourth-generation programming language. Developed by MathWorks, MATLAB allows matrix manipulations, plotting of functions and data, implementation of algorithms, creation of user interfaces, and interfacing with programs written in other languages, including C, C++, Java, Fortran and Python.

## Simple Math

~~~
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

Same as C/C++, except that it cannot start with underscore.

- Case sensitive

  ~~~
  >> cost = 1, Cost = 2, COST = 3, cOsT = 4
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
    
  ~~~
  >> this_is_a_valid_variable_name_42_foo_bar_ = 42
  this_is_a_valid_variable_name_42_foo_bar_ =
      42
  >> _this_is_not = 42
   _this_is_not = 42
   |
  Error: The input character is not valid in MATLAB statements or expressions.
  ~~~

### Keywords and Special Variables

Keywords cannot be used as variable names: `for`, `end`, `while`, `continue`, `break`, `if`, `elseif`, `else`, `switch`, `case`, `otherwise`, `function`, `return`, `try`, `catch`, `global`, `persistent`

Special variables: `ans`, `pi`, `eps`, `inf`, `NaN` (`nan`), `i`, `j`, `nargin`, `nargout`, `varargin`, `varargout`, &hellip;

{:.bg-warning}
Please do not overwrite these variables even though you can!

~~~
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

{:.bg-warning}
For C/C++ users: Do not use `i` or `j` as loop variables!
Moreover, you can always use `1i` or `2.0j` rather than `i` or `2.0 * j`.

~~~
>> [1 + i, complex(1, 1), 1 + 1i]
ans =
  Columns 1 through 2
            1 +          1i            1 +          1i
  Column 3
            1 +          1i
>> i = 10;
>> [1 + i, complex(1, 1), 1 + 1i]
ans =
  Columns 1 through 2
           11 +          0i            1 +          1i
  Column 3
            1 +          1i
~~~


## Script M-Files

[scriptexample.m]({{ site.githubfileurl }}{{ page.url }}/../scriptexample.m)

~~~
% scriptexample.m

clear;

a = 1;
b = 2
c = 3;
~~~

~~~
>> scriptexample
b =
     2
~~~
