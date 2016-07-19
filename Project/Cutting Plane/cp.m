clc;
t = cputime;

% A = [2 5;2 -2];
% b = [15;5];
% c = [3;4];

% A = [1 2 0 0 0 0;
%      1 1 0 0 0 3;
%      1 1 0 0 0 1;
%      0 0 1 -3 0 0;
%      0 0 1 -2 -5 0;
%      0 0 0 1 3 -4;
%      0 1 0 0 1 1];
% A = -A;
% A = [A;-eye(6);eye(6)];
% b = -1*ones(7,1);
% b = [b;zeros(6,1);10*ones(6,1)];
% c = [-1;-2;-0.5;-0.2;-1;0.5];

A = [Aeq;-Aeq;-eye(16);eye(16)];
b = [beq;-beq;ones(16,1);4*ones(16,1)];
c = ones(1,16)';
b(29) = -1;
b(31) = -4;
b(34) = -1;
b(40) = -3;
b(45) = 1;
b(47) = 4;
b(50) = 1;
b(56) = 3;
% b([133   138   176   183],1) = -1;
% linprog(-c,A,b)
[m,n] = size(A);
I = eye(m);
A = [A I];
c = [c;zeros(m,1)];
nonbas = (1:n)';
bas = (n+1:n+m)';
isDual = 0;
objValue = 0;
pivotT(A,b,c,bas,nonbas,objValue,isDual);
e = cputime - t;