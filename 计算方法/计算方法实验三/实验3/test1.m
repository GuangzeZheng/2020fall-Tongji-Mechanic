clear;
rand('seed',1851960);

%% settings
Const = [ 1,2,-2 ; 1,1,1 ; 2,2,1 ];
B     = randi(20,3,1);
x0    = [0;0;0];
pre   = 1e-6;

%% results
[y1,iteration_count1] = jacobi(Const,B,x0,pre);
[y2,iteration_count2] = Gauss_seidel(Const,B,x0,pre);