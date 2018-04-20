%%

%HOMEWORK 7 Part 2 - MECH 105
%Abdulla Al Ameri
%Date Due: 5, Feb, 2018

%%

clear
clc

%Intilaizing Variables.

Err = 1;
%Epsilon
%Intial amount of error we're starting with
%In which we know that if we added to 0 we are sure that
%MATLAB won't think it's zero!

while 0 + Err > 0 && Err ~= 0
    %The loop condidtion is necessary because if the error hit
    %zero then we will be stuck in the loop.
    
    ErrOld = Err; %This line will store the old error before choping it down by 2
    
    Err = Err * (0.5); %This will chop the error or epislon down by 2 and keep going
    %until it hits a value of which if you added this error to 0
    %Matlab will count it as 0, i.e. the smallest postivie MatLab Can
    %count.
    
end

ErrorMax = ErrOld
%This will print our error max, it's the previous error
%before we divide by 2, because after we divide by two at
%the end of the loop it will exceed the error we're looking for.

