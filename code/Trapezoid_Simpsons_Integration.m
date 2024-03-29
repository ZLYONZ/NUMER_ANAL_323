% %%=====Numerical Integration====
%%====Trapezoid Rule=======
% clc; close all; clear variables;
% a=0;b=pi/2;% total interval
% n=1000-1; h=(b-a)/n;% uniform grids
% x=a:h:b;% discrete points
% K=func(a)+func(b);% f_0+f_n
% 
% for i=2:n
%    K=K + func(x(i))*2;    
% end
% Result=K*h/2
% 
% 
% 
% function v=func(x)
% v=cos(x);%x.^2+exp(x); %% f(x)
% end

%%=====Simpsons====
clc; close all; clear variables;
a=1;b=5;% total interval
n=2; h=(b-a)/(2*n);% uniform grids
xodd=(a+h):2*h:(b-h);% discrete points
xeven=(a+2*h):2*h:(b-2*h);
S=(func(a)+4*sum(func(xodd))+2*sum(func(xeven))+func(b))


func(2)
func(4)

func(xodd)
func(3)

function v=func(x)
v=(exp(x)-exp(-x))/(exp(x)+exp(-x))+log(x);
end
