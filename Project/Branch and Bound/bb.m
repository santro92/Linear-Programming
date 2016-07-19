function [X,FVAL,e] = bb(f,A,b,Aeq,Beq,lb,ub)
t = cputime;
node = 1;
minPos = 1;
minValue = -Inf;
state = zeros(20,3);
while(node > 0)
    [newlb,newub] = bound(lb,ub,node,state);
    [state,minValue,minPos] = solve(f,A,b,Aeq,Beq,newlb,newub,node,state,minValue,minPos);
    [node] = nextNode(state);
end
[newlb,newub] = bound(lb,ub,minPos,state);
[X,FVAL] = linprog(f,A,b,Aeq,Beq,newlb,newub);
e = cputime-t;
end

