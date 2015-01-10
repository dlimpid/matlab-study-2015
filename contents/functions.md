---
title: Functions
---

# {{ page.title }}

## M-File Functions

~~~
function [out1, out2, out3] = dummyfunction(in1, in2, in3)
%DUMMYFUNCTION Does nothing :).
%    DUMMYFUNCTION() does nothing.
%
%    DUMMYFUNCTION(in1, in2, in3) also does nothing.
%
%    See also ZEROS, ONES, EYE.

% ...
end
~~~

### Rules

- The function name is actually the filename.
  The name from the first line in the file is just ignored.
  (It is better to be identical, of course.)
- Function names are case sensitive on \*nix, and *were* case insensitive on Windows.
  So it is better to use only lowercase letters for portability.
  One can use underscore, but conventionally it is seldom used.
- ![Function help text]({{ site.imagesurl }}/function-help-text.png){:.pull-right .img-thumbnail}
  The first contiguous lines of comments are the help text.

### Input and Output Arguments

- TODO: `varargin`, `varargout`
- TODO: `nargin`, `nargout`
- TODO: `narginchk`, `nargoutchk`
- TODO: Call by value

### Function Workspace

### Subfunctions

## Anonymous Functions and Function Handles
