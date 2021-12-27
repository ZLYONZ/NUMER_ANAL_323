function [X_1,k3, residual3] = SOR_result(A,B, tol, Nmax, w)
X_2 = zeros(length(A),1); % k3+1 step
X_1 = zeros(length(A),1); % k3 step
k3 = 0; % counter
residual3 = [];
%===k3=0======%initial guess
for i =1: length(A)
    X_1(i) = B(i)/A(i,i);
end
%===iteration======
while (norm(A*X_1-B)>tol && k3<Nmax) % |A*X_k3-B|>tol
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
    k3 = k3+1;
    residual3 = [residual3 norm(A*X_1-B)];
end
end






























% A=[20,-10,0;
%   -10,20,-10;
%     0,-10,20];
% B=ones(3,1);
% A_d=diag(A);
% A_nd=A-diag(A_d);
% Tol=1e-6;
% X0=B./A_d;Xk3=X0;counter=1;
% Residul=[];
% while (norm(A*Xk3-B)>=Tol)
%     counter=counter+1;
%     Xk3=(B-A_nd*Xk3)./A_d;
%     Residul=[Residul norm(A*Xk3-B)];
% end