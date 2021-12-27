function [X_1,k2, residual2] = GS_result(A,B, tol, Nmax, w)
X_2 = zeros(length(A),1); % k2+1 step
X_1 = zeros(length(A),1); % k2 step
k2 = 0; % counter
residual2 = [];
%===k2=0======%initial guess
for i =1: length(A)
    X_1(i) = B(i)/A(i,i);
end
%===iteration======
while (norm(A*X_1-B)>tol && k2<Nmax) % |A*X_k2-B|>tol
    for i =1: length(A)
        X_2(i) = (1-w)*X_1(i)+w*B(i)/A(i,i);
        for j =1: length(A)
            %====Jacobi
            %         if j ~= i
            %            X_2(i) =  X_2(i)-A(i,j)*X_1(j)/A(i,i);
            %         end
            %======GS/SOR=======
            if j < i
                X_2(i) =  X_2(i)-w*A(i,j)*X_2(j)/A(i,i);
            end
            if j > i
                X_2(i) =  X_2(i)-w*A(i,j)*X_1(j)/A(i,i);
            end
        end
    end
    X_1 = X_2;
    k2 = k2+1;
    residual2 = [residual2 norm(A*X_1-B)];
end
end
