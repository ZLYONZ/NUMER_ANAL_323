
function X=forward_subsitution(U,Y,dim1, dim2)
      X = [];     
     tmp_U = U;
     tmp_Y = Y;
     for j = dim1:-1:1
        m = tmp_U(j, j); % the element in the diagonal
        x_j = tmp_Y(j, 1) / m;
        X = [x_j, X];
        for i = (j-1):-1:1
            n = tmp_U(i, j); % the elements under the diagonal
            
            a = - (n / m);
            M = eye(dim1);
            M(i, j) = a;    %j-th row * a + i-th row
                        
            tmp_U = M * tmp_U;
            tmp_Y = M * tmp_Y;
        end
    end
    X = X';
end