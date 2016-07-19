Aeq = zeros(64,64);
Nsquare = 4;
n = 2;
lb = zeros(Nsquare,Nsquare,Nsquare);
counter = 1;
for j = 1:Nsquare % one in each row
    for k = 1:Nsquare
        Astuff = lb; % clear Astuff
        Astuff(1:end,j,k) = 1; % one row in Aeq*x = beq
        Aeq(counter,:) = Astuff(:)'; % put Astuff in a row of Aeq
        counter = counter + 1;
    end
end

for i = 1:Nsquare % one in each column
    for k = 1:Nsquare
        Astuff = lb;
        Astuff(i,1:end,k) = 1;
        Aeq(counter,:) = Astuff(:)';
        counter = counter + 1;
    end
end

for U = 0:n:(Nsquare-n) % one in each square
    for V = 0:n:(Nsquare-n)
        for k = 1:Nsquare
            Astuff = lb;
            Astuff(U+(1:n),V+(1:n),k) = 1;
            Aeq(counter,:) = Astuff(:)';
            counter = counter + 1;
        end
    end
end

for i = 1:Nsquare % one in each depth
    for j = 1:Nsquare
        Astuff = lb;
        Astuff(i,j,1:end) = 1;
        Aeq(counter,:) = Astuff(:)';
        counter = counter + 1;
    end
end

beq = ones(64,1);
lb = zeros(Nsquare,Nsquare,Nsquare);
ub = lb+1;

B = [2,1,1;
     2,3,4;
     3,2,1;
     4,4,3];
for i = 1:size(B,1)
    lb(B(i,1),B(i,2),B(i,3)) = 1;
end