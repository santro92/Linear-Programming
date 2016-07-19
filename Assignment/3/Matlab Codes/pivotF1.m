function [isDone] = pivotF1(A,b,c,bas,nonbas)
    isDone = 1;
    if(isempty(find(b<0, 1)))
        pivotF(A,b,c,bas,nonbas);
    elseif(isempty(find(c>0, 1)))
        [dualA, dualb, dualc, dualbas, dualnonbas] = dual(A,b,c,bas,nonbas);
        [~,~,objval,~,~] = pivotF(dualA, dualb, dualc, dualbas, dualnonbas);
        fprintf('The ObjVal is %f \n', -1*objval);
    else
        fprintf('The initial dictionary of both primal & dual is infeasible \n');
        isDone = 0;
    end
end

