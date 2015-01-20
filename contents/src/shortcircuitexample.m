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
