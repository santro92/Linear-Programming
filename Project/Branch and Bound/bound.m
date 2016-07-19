function [lb,ub] = bound(lb,ub,node,state)
  while(node > 1)
        if(mod(node,2) == 0)
            if(ub(state(node,1)) > state(node,2))
                ub(state(node,1)) = state(node,2);
            end
            node = node/2;
        else
            if(lb(state(node,1)) < state(node,2))
                lb(state(node,1)) = state(node,2);
            end
            node = (node - 1)/2;
        end  
  end
end

