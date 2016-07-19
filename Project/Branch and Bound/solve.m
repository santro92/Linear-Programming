function [state,minValue,minPos] = solve(f,A,b,Aeq,Beq,lb,ub,node,state,minValue,minPos)
    [X,FVAL,EXITFLAG] = linprog(f,A,b,Aeq,Beq,lb,ub);
    state(node,3) = EXITFLAG;
    if(EXITFLAG == 1)
        [state,minValue,minPos] = checkAndBranch(X,-1*FVAL,node,state,minValue,minPos);
    end
end

