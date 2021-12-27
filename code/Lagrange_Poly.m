clear
clc
%%===initial data set=====
xp = [-2,-1,0,1,2];
yp = [-0.964,-0.762,0,0.762,0.964];
%%=======================
syms lag_poly(x);
lag_poly(x) = 0;

for j=1: length(xp)
    N(j)=sym(yp(j));
    for k=1:length(xp)
        if k==j
        else
            N(j)=N(j)*(x-xp(k))/(xp(j)-xp(k)); % y*cardinal functions
        end
    end
    lag_poly(x) = lag_poly(x) + N(j);
end
simplify(lag_poly,10)