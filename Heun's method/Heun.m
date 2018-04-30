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

%Check for errors in input

if nargin == 4
    
    es = 0.001;
    maxit = 50;
    
elseif nargin == 5
    maxit = 50;
else
    error('You do not have enough inputs, check help');
end

% Making y array

y = y0;

%check for problems in span and correct it

t = 0:h:max(tspan);

if max(t) ~= max(tspan)
    
    t (length(t)+1) = max(tspan)
    
    for i = 1:length(t)-1
        h(i) = t(i+1) - t(i);
    end
    
else

    %Store h values in array to detect changes in step size
for i = 1:length(t)-1
    h(i) = t(i+1) - t(i);
    end
    
end


for j = 1 : length(t)-1

% itNum will keep track of how many itterations
% error will check the relative error in y

itNum = 0;
error2 = 0;

%Making the first prediction to avoid dividing by 0

k = 1;
Pred(k) = y(j) + h(j)*dydt(t(j),y(j)); %Prediction
Pred(k+1) = y(j) + h(j)/2 * (dydt(t(j),y(j))+ dydt(t(j+1),Pred(k))); %Correction
itNum = itNum + 1;
error2 = (abs ((Pred(k+1) - Pred(k)) / (Pred(k+1)) )) * 100 ;
k=k+1;
    
while itNum <= maxit && error2 >= es
%k=k+1;
%Pred(k) = y(j) + h(j)*dydt(t(j),y(j)); %Prediction
Pred(k+1) = y(j) + h(j)/2 * (dydt(t(j),y(j))+ dydt(t(j+1),Pred(k))); %Correction

%Checking the stopping Criteria.
error2 = (abs ((Pred(k+1) - Pred(k))) / abs((Pred(k+1)))) * 100 ; %error

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
