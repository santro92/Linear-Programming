function [] = pivotG(A,b,c,bas,nonbas)
    isDone = pivotF1(A,b,c,bas,nonbas);
    if(~isDone)
       fprintf('Solving by changing the primal objective func.');
       c(c>0) = -1;
       [dualA, dualb, dualc, dualbas, dualnonbas] = dual(A,b,c,bas,nonbas);
       [bas1,nonbas1,~,~,~] = pivotT(dualA, dualb, dualc, dualbas, dualnonbas);
       
       Ab = dualA(:,bas1);
       Ai = dualA(:,nonbas1);
       cb = dualc(bas1,:)';
       ci = dualc(nonbas1,:)';
       
       pII = (Ab'\cb')';
       b = -(ci - pII*Ai)';
       A = (-Ab\Ai)';
       [m,n] = size(A);
       A = [A eye(m)];
       c = [-1 1 0 0 0]';
       nonbas = (1:n)';
       bas = (n+1:m+n)';
       pivotT(A, b, c, bas, nonbas);
    end
end