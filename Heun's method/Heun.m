function [t,y] = Heun (dydt,tspan,y0,h,es,maxit)
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
    
    for i = 1:length(t)-1
        h(i) = t(i+1) - t(i);
    end
    
else

for i = 1:length(t)-1
    h(i) = t(i+1) - t(i);
    end
    
end

% itNum will keep track of how many itterations
% error will check the relative error in y


for j = 1 : length(t)-1

itNum = 0;
error = 0;
k = 1;
Pred(k) = y(j) + h(j)*dydt(t(j),y(j)); %Prediction
Pred(k+1) = y(j) + h(j)/2 * (dydt(t(j),y(j))+ dydt(t(j+1),Pred(k))); %Correction
%Pred(k+2) = Pred(k+1) + h(j)/2 * (dydt(t(j),y(j))+ dydt(t(j+1),Pred(k+1))); %Correction
itNum = itNum + 1;
error = (abs ((Pred(k+1) - Pred(k)) / (Pred(k+1)) )) * 100 ;
k=k+1;
    
while itNum <= maxit && error >= es
%k=k+1;
%Pred(k) = y(j) + h(j)*dydt(t(j),y(j)); %Prediction
Pred(k+1) = y(j) + h(j)/2 * (dydt(t(j),y(j))+ dydt(t(j+1),Pred(k))); %Correction

%Checking the stopping Criteria.
error = (abs ((Pred(k+1) - Pred(k))) / abs((Pred(k+1)))) * 100 ;

itNum = itNum + 1;
k = k+1;


end

y(j+1) = Pred(length(Pred)) %Store the corrected value
Pred = []; %Empty the predctions array

end

%Plot

plot(t,y,'r*:');
xlim = ([min(tspan),max(tspan)]);
ylim = ([min(y),max(y)]);
legend('Heuns method with iter')


%Show Table with Values

disp('The values'), disp('     [t]       [y]    ');
disp([t',y']);



end
