function [dualA, dualb, dualc, dualbas, dualnonbas] = dual(A,b,c,~,nonbas)
    Ai = A(:,nonbas);
    [m,n] = size(Ai);
    dualA = -(Ai)';
    I = eye(n);
    dualA = [dualA I];
    
    dualb = -(c(1:length(nonbas), :));
    
    dualc = -(b);
    dualc = [dualc ; zeros(length(nonbas),1)];
    
    dualnonbas = (1:m)';
    dualbas = (m+1:m+n)';
end