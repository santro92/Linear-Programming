function [auxA, auxb, auxc, auxbas, auxnonbas] = Auxiliary(A,b,c,bas,nonbas)
    [m,n] = size(A);
    auxA = [-ones(m,1) A];
    auxb = b;
    auxnonbas = [1 nonbas'+1]';
    auxbas = bas+1;
    auxc = [1 zeros(1,n)]';
end

