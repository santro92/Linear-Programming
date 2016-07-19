% B = [1,2,2;
%     1,5,3;
%     1,8,4;
%     2,1,6;
%     2,9,3;
%     3,3,4;
%     3,7,5;
%     4,4,8;
%     4,6,6;
%     5,1,8;
%     5,5,1;
%     5,9,6;
%     6,4,7;
%     6,6,5;
%     7,3,7;
%     7,7,6;
%     8,1,4;
%     8,9,8;
%     9,2,3;
%     9,5,4;
%     9,8,2];
% 
% N = 3;

B = [2,1,1;
     2,3,4;
     3,2,1;
     4,4,3];
 
N = 2;

drawSudoku(B,N) % For the listing of this program, see the end of this example.
S = sudokuEngine(B,N); % Solves the puzzle pictured at the start
drawSudoku(S,N)