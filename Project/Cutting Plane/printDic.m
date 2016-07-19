function [] = printDic(A,b,c,bas,nonbas,objValue,dualDic)
[m,n] = size(A);
if(dualDic)
    char = 'y';
else
    char = 'x';
end
fprintf('\n');
for i = 1:m
    fprintf('%c(%i) = %+5.2f' ,char,bas(i),b(i));
    for j = 1:n
        fprintf(' %+5.2f %c(%i)', -A(i,j),char,nonbas(j));
    end
    fprintf('\n');
end
fprintf('\nZ = %+5.2f' ,objValue);
for j = 1:n
        fprintf(' %+5.2f %c(%i)', c(j),char,nonbas(j));
end
fprintf('\n');
end

