A = [21 32 14 8 6 9 11 3 5; 17 2 8 14 55 23 19 1 6; 41 23 13 5 11 22 26 7 9; 
    12 11 5 8 3 15 7 25 19; 14 7 3 5 11 23 8 7 9; 2 8 5 7 1 13 23 11 17; 
    11 7 9 5 3 8 26 13 17; 23 1 5 19 11 7 9 4 16; 31 5 12 7 13 17 24 3 11];

B = [2; 5; 7; 1; 6; 9; 4; 8; 3];

[dim1, dim2] = size(A);

[L, U] = LUcalculator(A, dim1, dim2);

Y = backward_subsititution (L,B,dim1, dim2);

X = forward_subsitution(U,Y,dim1, dim2);