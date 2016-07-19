c = ones(6,1);
A = [1 1 0 0 0 0; 1 1 0 0 0 1; 0 0 1 1 0 0; 0 0 1 1 1 0; 0 0 0 1 1 1; 0 1 0 0 1 1];
b = ones(6,1);

cType = 'LLLLLL';
vType = 'IIIIII';

[xOpt, fVal, stat] = glpk(c,A,b,[],[],cType,vType);