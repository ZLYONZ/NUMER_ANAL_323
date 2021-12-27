function Y=backward_subsititution (L,B,dim1, dim2)
    Y = [];
    tmp_L = L;
    tmp_B = B;
    for j = 1:dim1
        m = tmp_L(j, j); % the element in the diagonal
        y_j = tmp_B(j, 1) / m;
        Y = [Y, y_j];
        for i = (j+1):dim1
            n = tmp_L(i, j); % the elements under the diagonal
            a = - (n / m);
            M = eye(dim1);
            M(i, j) = a;    %j-th row * a + i-th row
            tmp_L = M * tmp_L;
            tmp_B = M * tmp_B;
        end
    end    
Y = Y';
    %y = L \ B    % test using matlab function
    