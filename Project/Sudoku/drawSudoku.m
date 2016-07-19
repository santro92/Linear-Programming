function drawSudoku(B,N)

Nsquare = N * N;

figure;
hold on;
axis off;
axis equal % prepare to draw
rectangle('Position',[0 0 Nsquare Nsquare],'LineWidth',N,'Clipping','off') % outside border
rectangle('Position',[N,0,N,Nsquare],'LineWidth',2) % heavy vertical lines
rectangle('Position',[0,N,Nsquare,N],'LineWidth',2) % heavy horizontal lines
for i = 1:N:Nsquare
    rectangle('Position',[0,i,Nsquare,1],'LineWidth',1) % minor horizontal lines
end
for i = 1:N:Nsquare
    rectangle('Position',[i,0,1,Nsquare],'LineWidth',1) % minor vertical lines
end

% Fill in the clues
%
% The rows of B are of the form (i,j,k) where i is the row counting from
% the top, j is the column, and k is the clue. To place the entries in the
% boxes, j is the horizontal distance, 10-i is the vertical distance, and
% we subtract 0.5 to center the clue in the box.
%
% If B is a 9-by-9 matrix, convert it to 3 columns first

if size(B,2) == Nsquare % 9 columns
    [SM,SN] = meshgrid(1:Nsquare); % make i,j entries
    B = [SN(:),SM(:),B(:)]; % i,j,k rows
end

for ii = 1:size(B,1)
    text(B(ii,2)-0.5,(Nsquare + 0.5)-B(ii,1),num2str(B(ii,3)))
end

hold off

end