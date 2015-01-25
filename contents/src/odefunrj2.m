function dy = odefunrj2(~, y, L)
if nargin < 3
  L = [-0.1 -1; 0.6 -0.2];
end
dy = L * y;
end

