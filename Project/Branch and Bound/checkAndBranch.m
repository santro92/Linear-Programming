function [state,minValue,minPos] = checkAndBranch(X,FVAL,node,state,minValue,minPos)
    X = single(X);
    Y = (X - floor(X));
    isempty(find(Y> 1E-08, 1))
    if(isempty(find(Y> 1E-08, 1)))
        if(minValue < FVAL)
        	minValue = FVAL;
            minPos = node;
        end
    elseif((minValue == -Inf) || (minValue < FVAL))
        pos = find(X == max(X(Y > 1E-08)),1);
        state((2*node),:) = [pos floor(X(pos)) 2];
        state((2*node + 1),:) = [pos ceil(X(pos)) 2];
    end
end

