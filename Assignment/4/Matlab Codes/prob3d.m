clc;
% A = randi(3,3);
% b = randi(3,3,1);
% B = randi(3,3);

x = A\b;

A = B*x;
b = zeros(size(A,1),1);

[m,n] = size(A);

M1=[ A -eye(m);
    -A -eye(m);
    zeros(m,n) -eye(m)];

r1=[b; -b; zeros(m,1)];

f1=-1 * [zeros(n,1); ones(m,1)];

[X11,FVAL,EXITFLAG] = linprog(f1,M1,r1)
