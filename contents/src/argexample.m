function [x, y, z, varargout] = argexample(x, a, b, varargin)

fprintf('nargin = %d, nargout = %d\n', nargin(), nargout());

if nargin() < 3 % ~exist('b', 'var')
  b = -3;
  if nargin() < 2 % ~exist('a', 'var')
    a = -2;
    if nargin() < 1 % ~exist('x', 'var')
      x = -1;
    end
  end
end

if nargout() == 2
  y = [a b];
else
  y = a;
  z = b;
end

varargout = varargin(end:-1:1);

end

