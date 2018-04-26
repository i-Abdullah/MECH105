function [t,y] = (dydt(t,y),tspan,y0,h,es,maxit)
%HOMEWORK 23 - MECH 105
%Abdulla Al Ameri
%Due Date: 30th, April, 2018
%---------------------------
%
%This function will attepmt to solve differential equations using
%Iterative Heun's method (AKA predictor-corrector).
%
%---------------------------
%
%INPUTS:
%
%	dydt(t,y) - anonymous differential equation
%
%   tspan     - span of t values
%
%	 y0       - Initial condition for x0
%
%	 es       - Stopping criteria: relative error
%             [ will deafult to 0.001 if user left it empty. ]
%
%	 maxit    - maximum number of iterations
%             [ will deafult to 50 if user left it empty. ]
%
%
%-----------------------
%OUTPUTS:
%
%       t    - set of t values (will start from 0)
%       y    - set of y values
%       Plot - Plot for t and y
%
%---------------------------


y = y0;

%check for problems in span and correct it

t = 0:h:max(tspan);

if max(t) ~= max(tspan)
    
    t (length(t)+1) = max(tspan)
    
    for i = 1:length(tspan)-1
        h(i) = t(i+1) - t(i)
    end
    
end



for j = 1 : length(t)-1
    
    %Predict
    
    y(j+1) = y(j) + dydt(t(j),y(j)
    
    %Correct:
    
% itNum will keep track of how many itterations
% error will check the relative error in y

itNum = 0;
error = 0;
    
    while itNum <= maxit && error >= es
        
y(j+1) = y(j) + h(j)/2 * (dydt(t(j),y(j)+ dydt(t(j+1),y(j+1));
itNum = itNum + 1;

if j ~= 1
    
error = (abs ((y(j+1) - y(j)) / (y(j)) )) * 100 ;

end
              
    end
    

end
end