function [v,opt]=problem1(A,B,b)
  [m, n] = size(A);
  p = size(B, 1);
  c = [zeros(m + p,1); -ones(p, 1)];
  M = [-A' -B' zeros(n, p); 
       b' zeros(1, 2 * p);
       zeros(p, m) eye(p) -eye(p);
       zeros(p, m) -eye(p) -eye(p)];
  N = zeros(n + 1 + 2 * p, 1);
  lb = [zeros(m, 1); -Inf(p, 1); zeros(p, 1)];
  ub = [Inf(m, 1); Inf(p, 1); Inf(p, 1)];
  [x,t] = linprog(c,M,N,[],[],lb,ub,[]);
  opt = -t;
  v = x(m+1:m+p);
end