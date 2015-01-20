---
title: Conditional statements
---
## If-elseif-else-end statements

Syntax:

~~~matlab
if expression
  statements
elseif expression
  statements
else
  statements
end
~~~

The expression is true when the result is **nonempty** and **all elements are true (nonzero)**.

~~~plain
>> if [], disp('true'), else, disp('false'), end
false
>> if [1 0 1], disp('true'), else, disp('false'), end
false
>> if [true false true], disp('true'), else, disp('false'), end
false
>> if [1 2; 3 4], disp('true'), else, disp('false'), end
true
~~~

Use `any` or `all` to determine if any or all array elements are true.

~~~plain
>> [all([true true true]) all([true true false])]
ans =
     1     0
>> [any([true false false]) any([false false false])]
ans =
     1     0
~~~


## Switch statements

Syntax:

~~~matlab
switch switch_expression
  case case_expression
    statements
  case case_expression
    statements
  ...
  otherwise
    statements
end
~~~

{:.alert .alert-info}
The statement `break` is not needed at the end of each case. Of course, therefore, fall-through is not possible.

Cases can accepts several expressions.

~~~matlab
switch s
  case 'a'
    % ...
  case {'b', 'c', 'd'}
    % ...
  otherwise
    % ...
end
~~~
