function [L, U] = LUcalculator(A, dim1, dim2)
    M_inv = eye(dim1);
    U = A;
    for j = 1:dim1
        m = U(j, j); % the element in the diagonal
        for i = (j+1):dim1
            n = U(i, j); % the elements under the diagonal
            a = - (n / m);
            tmp_inv = eye(dim1);
            tmp_inv(i, j) = -a;
            M_inv = M_inv * tmp_inv;
            U(i, :) = U(i, :) + U(j, :) * a; %j-th row * a + i-th row
        end
    end
    L = M_inv;
 end