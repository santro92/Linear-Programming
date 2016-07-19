function [XInf, resInf] = LInfnorm(A,b)
    [m,n] = size(A);
    M2=[A -ones(m,1);
        -A -ones(m,1);
        zeros(1,n) -1];

    r2=[b; -b; 0];

    f2=[zeros(n,1); 1];

    Xinf1=linprog(f2,M2,r2);
    XInf = Xinf1(1:n);
    resInf = A*XInf -b;
end

