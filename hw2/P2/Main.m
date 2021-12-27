%% Bisection method for Nonlinear equations F(x)==0

F =@(x) exp(cos(x)+cos(x^2))+cos(x)-1; % f(x)=x^2-1 ==0

a_0=0; b_0=2; % check if f(a)*f(b)<0
tol=1e-6;
%% ========Bisectio function===
[initial_guess, count, result]=Bisection(a_0, b_0, tol, F);