clc; clear; close all
 
tol=1e-10; Nmax=1000;

A = zeros(Nmax);
for i = 1: Nmax
    A(i, i) = 40;
    if i < Nmax
        A(i+1, i) = -10;
    end
    if i > 1
        A(i-1, i) = -10;
    end
end
B = ones(Nmax, 1);

[X,k1,residual1] = Jacobi(A, B, tol, Nmax);
fprintf('L1 norm of Jacobi: %.6f\n', norm(X,1))
fprintf('L∞ norm of Jacobi: %.6f\n', norm(X,Inf))
fprintf('L2 norm of Jacobi: %.6f\n', norm(X,2))
plot(1:k1, residual1, 'x-'),
hold on

w=1;
[X,k2, residual2] = Gauss_Seidel(A, B, tol, Nmax, w);
fprintf('L1 norm of GS: %.6f\n', norm(X,1))
fprintf('L∞ norm of GS: %.6f\n', norm(X,Inf))
fprintf('L2 norm of GS: %.6f\n', norm(X,2))
plot(1:k2, residual2, '+-'),
hold on

w=1.1;
[X,k3, residual3] = SOR(A, B, tol, Nmax, w);
fprintf('L1 norm of SOR: %.6f\n', norm(X,1))
fprintf('L∞ norm of SOR: %.6f\n', norm(X,Inf))
fprintf('L2 norm of SOR: %.6f\n', norm(X,2))
plot(1:k3, residual3, 'o-')

xlabel('iterative steps'), ylabel('Norm-2 of residual vector')
legend('Jacobi','Gauss-Seidel','SOR')
title('norm-2 of residual vector V.S. iterative steps')

