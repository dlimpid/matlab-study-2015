function conditionalexample()

% Short-circuit
counter = 0;
fprintf('Example 1\n');
if countandreturn(true) || countandreturn(false)
  disp('True');
else
  disp('False');
end

counter = 0;
fprintf('\nExample 2\n');
if countandreturn(false) || countandreturn(true)
  disp('True');
else
  disp('False');
end

counter = 0;
fprintf('\nExample 3\n');
if countandreturn(false) || countandreturn(false)
  disp('True');
else
  disp('False');
end

  % Nested function
  function b = countandreturn(b)
    counter = counter + 1;
    fprintf('counter = %d\n', counter);
  end
end
