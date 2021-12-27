function [initial_guess, count, result]=bise(a_0, b_0, tol, F)
result=[];

if F(a_0)*F(b_0)>0
    error('cannot use Bisection')
end
count=0; max_count=100;
c=(a_0+b_0)/2;
initial_guess=c;
result=[result c];
a_n=a_0; b_n=b_0;
%========Bisection loop====

while (abs(F(c))>tol && b_n-a_n>tol && count<=max_count)
    if F(a_n)*F(c)<0
        a_n=a_n; b_n=c;
    elseif F(a_n)*F(c)>0
        a_n=c; b_n=b_n;
    end
    c=(a_n+b_n)/2;
    count=count+1;
    if count>=max_count %%===max iterative steps
        break;
    end    
    result=[result c];     
end
result

end

