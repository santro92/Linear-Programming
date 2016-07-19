function [] = nDegreePolynomial(n,x,y,t)  
    [m,~] = size(x);
    A = [zeros(m,n-1) x ones(m,1)];
    b = y;
    
    for i = 2:n
        A(:,n-i+1) = (x.^i);
    end

    [X1,res1] = L1norm(A,b)
    [XInf, resInf] = LInfnorm(A,b)

    plotGraph(n,x,y,X1,XInf,res1,resInf,t);  
end

