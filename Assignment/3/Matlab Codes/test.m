clc
prompt = 'Enter Values between 1-5: ';
x =input(prompt);
if(x==1)
    %LP with feasible initial dictionary%
    A = [2 5; 2 -2];
    I = eye(2);
    A = [A I];
    b = [15 15]';
    c = [3 4 0 0]';
    bas = [3 4]';
    nonbas = [1 2]';
    pivotF(A,b,c,bas,nonbas);
elseif(x==2)
    %LP that cycles%
    A = [0.5 -5.5 -2.5 9; 0.5 -1.5 -0.5 1; 1 0 0 0];
    I = eye(3);
    A = [A I];
    b = [0 0 1]';
    c = [10 -57 -9 -24 0 0 0]';
    bas = [5 6 7]';
    nonbas = [1 2 3 4]';
    pivotT(A,b,c,bas,nonbas);
elseif(x==3)
    %LP with feasible initial dual dictionary%
    A = [-2 7; -3 1; 9 -4; 1 -1; 7 -3; -5 2];
    I = eye(6);
    A = [A I];
    b = [6 -1 6 3 6 -3]';
    c = [-1 -2 0 0 0 0 0 0]';
    bas = [3 4 5 6 7 8]';
    nonbas = [1 2]';
    pivotF1(A,b,c,bas,nonbas);
 elseif(x==4)
    %LP using Dual-Based Phase Algorithm%
    A = [-2 -1; -2 4; -1 3];
    I = eye(3);
    A = [A I];
    b = [4 -8 -7]';
    c = [-1 4 0 0 0]';
    bas = [3 4 5]';
    nonbas = [1 2]';
    pivotG(A,b,c,bas,nonbas);
 elseif(x==5)
    %LP with infeasible initial dictionary%
    A = [2 -1 1; 2 -3 1; -1 1 -2];
    I = eye(3);
    A = [A I];
    b = [4 -5 -1]';
    c = [1 -1 1 0 0 0]';
    bas = [4 5 6]';
    nonbas = [1 2 3]';
    pivotF2(A,b,c,bas,nonbas);
else
    msg = 'Enter Values Only between 1-5';
    disp(msg);
end

