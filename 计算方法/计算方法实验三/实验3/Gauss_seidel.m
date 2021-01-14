function [y,iteration_count] = Gauss_seidel(A,b,x0,precision)
D = diag(diag(A));
U = -triu(A,1);
L = -tril(A,-1);
G = (D-L)\U;
C = (D-L)\b;
y = G*x0+C;
iteration_count = 1;

while norm(y-x0)>precision
    x0=y;
    y=G*x0+C;
    iteration_count=iteration_count+1;
end
end