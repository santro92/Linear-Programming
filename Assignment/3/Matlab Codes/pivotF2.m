function [A2,b2,c2,bas2,nonbas2] = pivotF2(A,b,c,bas,nonbas)

if (~pivotF1(A,b,c,bas,nonbas))
    fprintf('Solving using Initialisation Phase');
    [A2,b2,c2,bas1,nonbas1] = Auxiliary(A,b,c,bas,nonbas);
    bas2=bas1;
    nonbas2 = nonbas1;
    [m,n] = size(A2);
    eI = find(nonbas1 == 1);
    lI = find(b2==min(b2),1);
    
    b2(lI) = b2(lI) * -1;
    for i = 1:m
        if (i ~= lI)
            b2(i) = b2(i) + b2(lI);
        end
    end
    
    A2(lI,:) = A2(lI,:) / A2(lI,eI);
    for i = 1:m
        if (i ~= lI)
            A2(i,:) = A2(i,:) + (A2(lI,:) * -A2(i,eI));
        end
    end
   
    c2 =-c2 + ((A2(lI,:)) * c2(eI))';
    
    
    nonbas2(eI,1) = bas1(lI,1);
    bas2(lI,1) = nonbas1(eI,1);
    isFinal = 0;
    isUnbounded = 0;
    while ((isFinal ~= 1) && (isUnbounded ~= 1))
        [bas2,nonbas2,~,isFinal,isUnbounded,eI,lI] = pivot(A2,b2,c2,bas2,nonbas2);
        
        b2(lI) = b2(lI) / A2(lI,eI);

        for i = 1:m
            if (i ~= lI)
                b2(i) = b2(i) + b2(lI)* -A2(i,eI);
            end
        end
 
        A2(lI,:) = A2(lI,:) / A2(lI,eI);
        for i = 1:m
            if (i ~= lI)
                A2(i,:) = A2(i,:) + (A2(lI,:) * -A2(i,eI));
            end
        end
    
        c2 = -1 * (-c2 + (c2(eI) * (A2(lI,:)))');
        
        if (~(isempty(find(nonbas2 == 1, 1))))
            break;
        end   
    end
    
    A2(:,1) = [];
    nonbas2(nonbas2 == 1,:) = [];
    nonbas3 = nonbas2 - 1;
    bas3 = bas2 -1;
    x = find(c ~= 0) ;
    c3 = zeros(1,n-1);
    
    for i = 1:size(x)
        if(~isempty(find(bas3 == x(i), 1)))
            c3(1,:) = c3(1,:) + c(x(i)) * -A2(bas3 == x(i),:);
            c3(1,x(i))= c3(1,x(i)) + c(x(i));
        else
            c3(1,x(i)) = c3(1,x(i)) + c(x(i));
        end
        
    end
    
    isFin = 0;
    isUnbound = 0;
    
    while ((isFin ~= 1) && (isUnbound ~= 1))
        [bas3,nonbas3,objvalue,isFin,isUnbound] = pivot(A2,b2,c,bas3,nonbas3);
    end
    
    fprintf(1,'Primal Objval: %d\n',objvalue);
end
