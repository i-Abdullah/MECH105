function [I] = Simpson(x,y)
%HOMEWORK 21 - MECH 105
%Abdulla Al Ameri
%Due Date: 6th, April, 2018
%---------------------------
%
%Simpsons function will use mix of simpsons 1/3 composite rule and single
%application of trapaziodal rule if needed to approximate the integral for
%given set of inputs and outputs.
%
%---------------------------
%INPUTS:
%       x - array that represents the input
%       y - array that represents the input
%       Note: they have to be the same size
%
%-----------------------
%OUTPUTS:
%
%       I - Approximation of an integral.
%
%---------------------------

%Check if they're equally spaced


if (abs(max(diff(x))) - abs(min(diff(x)))) ~= 0
    
    error('Vector is not equally spaced');
    
end

%Check if they're the same length

if length(x) ~= length(y)
    
    error('Vectors does not have equal length')
    
end

%----------------------------------------------------------%


NumSeg = length(x) - 1; % how many segments / intervals / shapes
NumPoints = length(x); % how many points



if mod(NumPoints,2) == 0 %Check if we have odd or even number of points
    
warning ('We will use Trapzoidal rule at the last segment');
%If it's even number of points throw an warning


Width = x(NumPoints-1)-x(1);

y_init = y(1); %first value, y_0

y_final = y(NumPoints-1); %Last y

OddIndices = 2:2:(NumSeg-1); %Get the odd indecies

EvenIndices = 3:2:(NumSeg-2); %Get the even indecies

OddOut = 4 * sum(y(OddIndices)); %Plug in odd indecies, find outputs

EvenOut = 2 * sum(y(EvenIndices)); %Plug in even indecies, find outputs

SimpsonSum = Width * (( (y_init) + (y_final) + (OddOut) + EvenOut)/ (3*(NumSeg-1) )); % Get integral approx from simpsons 1/3

Trapz = (( y(NumPoints) + y(NumSeg) ) / 2 ) * (x(NumPoints)-x(NumSeg)); %Get the last segment from trapz rule

I = Trapz + SimpsonSum %Add up the two results.
    
    
else
    
Width = x(NumPoints)-x(1); %Width of each segment

y_init = y(1); %first value, y_0

y_final = y(NumPoints); %Last output

OddIndices = 2:2:(NumPoints-1); %Get the odd indecies

EvenIndices = 3:2:(NumPoints-2); %Get the even indecies

OddOut = 4 * sum(y(OddIndices)); %Plug in odd indecies, find outputs

EvenOut = 2 * sum(y(EvenIndices)); %Plug in even indecies, find outputs

I = Width * ((y_init + y_final + OddOut + EvenOut)/(3*(NumPoints-1))); %Get integral approx.
    
    
end


end