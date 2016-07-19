function [X1,res1] = L1norm(A,b)
    [m,n] = size(A);

    M1=[ A -eye(m);
        -A -eye(m);
        zeros(m,n) -eye(m)];

    r1=[b; -b; zeros(m,1)];

    f1=[zeros(n,1); ones(m,1)];

    X11=linprog(f1,M1,r1);
    X1=X11(1:n);
    res1 = A*X1- b;
end

