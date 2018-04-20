clear
clc

K = 0.05; %Reaction?s equilibrium constant.
pt = 3; %Total Pressure.

f = @(x) ((x/(1-x))*sqrt((2*pt)/(2+x)))- K; %The Function.

Plot = fplot (f); %Plot the function.
xlim([-10 10]); %Restrict Domain
ylim([-10,10]); %Restrict Range
refline(0,0); %Put a zero refrence line

[Guess,output] = getpts;

if length(Guess) > 1
    error('you picked more than one guess, pick only one.Restart the code.');
end

%This code will use the function getpts and then display the graph for you.
%All you have to do is pick a point of initial guess on the graph.
%Double click on the guess point juest once, don't pick two guesses.
%Error will show if more than two points are.

Sloution1 = fzero(f,Guess)

%Use fzero function in matlab to estimate the root with initial guess of
%0.5.



Sloution2 = fsolve(f,Guess)

%Another way: solve the function for using function solving.