function [y,iteration_count] = jacobi(A,b,x0,precision)

D = diag(diag(A));
U = -triu(A,1);
L = -tril(A,-1);
B = D\(L+U);
C = D\b;
y = B*x0+C;
iteration_count = 1;

while norm(y-x0)>precision
    x0=y;
    y=B*x0+C;
    iteration_count=iteration_count+1;
end
end