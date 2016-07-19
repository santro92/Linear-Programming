clc;
x = [3 4 5 6 8 10 12 15]';
y = [16 12 9.6 7.9 6 4.7 4 8.5]';
prompt = 'enter the value of n: ';
n = input(prompt);
nDegreePolynomial(n,x,y,'With Outliers');
