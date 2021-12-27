function [X_1,k1,residual1] = jacobi_result(A,B, tol, Nmax)
X_2 = zeros(length(A),1); % k1+1 step
X_1 = zeros(length(A),1); % k1 step
k1 = 0; % counter
residual1 = [];
%===k1=0======%initial guess
for i =1: length(A)
    X_1(i) = B(i)/A(i,i); 
end
%===iteration======
while (norm(A*X_1-B)>tol && k1<Nmax) % |A*X_k1-B|>tol 
for i =1: length(A)
    X_2(i) = B(i)/A(i,i);
    for j =1: length(A)
        if j ~= i
           X_2(i) =  X_2(i)-A(i,j)*X_1(j)/A(i,i);
        end
%       if j < i
%           X_2(i) =  X_2(i)-A(i,j)*X_2(j)/A(i,i);
%       end
%       if j > i
%           X_2(i) =  X_2(i)-A(i,j)*X_1(j)/A(i,i);
%       end
    end
end
X_1 = X_2;
k1 = k1+1;
residual1 = [residual1 norm(A*X_1-B)];
end
end