---
title: Conditional Statements
---

# {{ page.title }}

## If-Elseif-Else-End Statements

Syntax:

~~~
if <expression>
  <statements>
elseif <expression>
  <statements>
else
  <statements>
end
~~~

The expression is true when the result is *nonempty* and *all elements are true (nonzero)*.

~~~
>> if [], disp('Hit!'), end % false
>> if [1 0 1], disp('Hit!'), end % false
>> if [true false true], disp('Hit!'), end % false
>> if [1 2 3], disp('Hit!'), end
Hit!
~~~

Use `any` or `all` to determine if any or all array elements are true.

~~~
>> [all([true true true]) all([true true false])]
ans =
     1     0
>> [any([true false false]) any([false false false])]
ans =
     1     0
~~~

### Shortcut Evaluation

## Switch Statements

Syntax:

~~~
switch <switch_expression>
  case <case_expression>
    <statements>
  case <case_expression>
    <statements>
  ...
  otherwise
    <statements>
end
~~~
