clc;

% f = [-3;-4];
% A = [2 5;2 -2];
% b = [15;5];
% Aeq = [];
% beq = [];
% lb = zeros(size(A,2),1);
% ub = 10 * Inf(size(A,2),1);

% f = -1*[-1;-2;-0.5;-0.2;-1;0.5];
% A = -1*[1 2 0 0 0 0;1 1 0 0 0 3;1 1 0 0 0 1;0 0 1 -3 0 0;0 0 1 -2 -5 0;0 0 0 1 3 -4;0 1 0 0 1 1];
% b = -1*ones(7,1);
% Aeq = [];
% beq = [];
% lb = zeros(size(A,2),1);
% ub = 10 * ones(size(A,2),1);

% A=[];
% b=[];
% f = (1:64)';

[X,FVAL,e] = bb(f,A,b,Aeq,beq,lb,ub);
fprintf('Total Time taken is %5.2f secs \n',e);
for i=1:length(X)
    fprintf('x(%d) = %5.2f\n',i,X(i));
end
fprintf('Objval = %5.2f\n',-1*FVAL);


