function [node] = nextNode(state)
    M = find(state(:,3) == 2);
    if(isempty(M))
        node = 0;
    else
        node = M(randi(numel(M)));
    end
end

