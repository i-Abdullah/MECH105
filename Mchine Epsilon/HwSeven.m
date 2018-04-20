%%

%HOMEWORK 7 - MECH 103
%Abdulla Al Ameri
%Date Due: 5, Feb, 2018

%%

clear
clc

%Intilaizing Variables.

Epsl = 1; %Epsilon

while Epsl + 1 > 1
%The loop will run until Epsilon + 1 is still bigger
%than one, i.e. it'll stop when it's == 1 or smaller.
    
    Epsl = Epsl * (0.5);
%Everytime we will go down by a factor of 2 and
%check for the condition.
    
end

%When you find the value that hits your error you will mutliply
%By 2 to go an error limit up, i.e. Epsl*2 is your max error at which
%if you exceed you will have an error.

Epsl = Epsl * 2

