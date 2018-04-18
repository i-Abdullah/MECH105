
function nd = MyDays (mo,da,leap)
%HOMEWORK 4 - MECH 103
%Abdulla Al Ameri
%Date: 30, January, 2018
%---------------------------
%Note: Although the instructions were to name this function "days",
%I choose to name it as MyDays because there's a built in function in
%matlab called "days" and I didn't want to overwrite it.
%---------------------------
%This Function meant to cacluate how many days has passed in a given date
%---------------------------
%INPUTS:
%       mo - Number of the month (from 1 to 12)
%       da - Number of the Day (from 1 to 31)
%       leap - To define if it's a leap year or not (1 is leap, 0 is not)
%-----------------------
%OUTPUTS:
%       nd - Number of days in that year.
%---------------------------
% IMPORTANT: An end of the day is included, i.e.: if your day was the 5th
% day of the month, this day will be included in the cacluations, in other
% words the code will assume that you finished the 5th day!
%---------------------------
%
%Hint: What happens when the dat is 17th of November? (Try it!)
%
%--------------


%If user inputs more than 3 arguments error massage will show up!

if nargin ~= 3
    error('This function requires exactly 3 variable inputs. Check help.')
end

%The following to elminate user mistakes in case they input more months\
%than usual (12 in a year), or more days in months that has specific number
%of days taking into considration leap and non-leap years.

if mo < 1 || mo > 12
    error('You Cannot have more than 12 month in a year nor less than 1!')
elseif da < 1 || da > 31
    error ('You Cannot have more than 31 day in a month nor less than 1!')
elseif leap > 1 || leap < 0
    error ('You cannot input anything but 0 or 1, 0 means non-leap year, 1 means a leap year')
elseif mo == 2 && da>29 && leap == 1
    error ('You cannot have more than 29 days in Feb. of a leap year')
elseif mo == 2 && da>28 && leap == 0
    error ('You cannot have more than 28 days in Feb. of a non-leap year')
elseif mo == 4 && da>30
    error ('You cannot have more than 30 days in April.')
elseif mo == 6 && da>30
    error ('You cannot have more than 30 days in July.')
elseif mo == 9 && da>30
    error ('You cannot have more than 30 days in Sept.')
elseif mo == 11 && da>30
    error ('You cannot have more than 30 days in Nov.')
end


%We're starting from the assumption that each month has 31 days, then we're
%substracting the extra number of days when the month is less than 31 day,
%and substracting an extra 3 days if the year is not leap and the month
%is after Feb or substracting 2 days if the year is leap.

%Also notice that some months after Feb or and before Dec 

nd = mo*31;
nd = nd - (31-da);

if mo == 4 && leap == 1;
    nd = nd - 2;
elseif mo == 5 && leap == 1;
    nd = nd - 3;
elseif mo == 6 && leap == 1;
    nd = nd - 3;
elseif mo == 7 && leap == 1;
    nd = nd - 4
elseif mo == 8 && leap == 1;
    nd = nd - 4;
elseif mo == 9 && leap == 1;
    nd = nd - 4;
elseif mo == 10 && leap == 1;
    nd = nd - 5;
elseif mo == 11 && leap == 1;
    nd = nd - 5;
elseif mo == 12 && leap == 1;
    nd = nd - 6;
elseif mo == 1 && leap == 1;
    nd = nd;
elseif mo == 2 && leap == 1;
    nd = nd;
elseif mo == 3 && leap == 1;
    nd = nd - 2;
%Conditions when the year isn't leap
elseif mo == 4 && leap == 0;
    nd = nd - 3;
elseif mo == 5 && leap == 0;
    nd = nd - 4;
elseif mo == 6 && leap == 0;
    nd = nd - 4;
elseif mo == 7 && leap == 0;
    nd = nd - 5;
elseif mo == 8 && leap == 0;
    nd = nd - 5;
elseif mo == 9 && leap == 0;
    nd = nd - 5;
elseif mo == 10 && leap == 0;
    nd = nd - 6;
elseif mo == 11 && leap == 0;
    nd = nd - 6;
  elseif mo == 12 && leap == 0;
    nd = nd - 7;
elseif mo == 1 && leap == 0;
    nd = nd;
elseif mo == 2 && leap == 0;
    nd = nd;
elseif mo == 3 && leap == 0;
    nd = nd - 3;
end

if mo == 11 && da == 17
    fprintf('%s\n','Happy BirthDay Abdulla! :D ');
    fprintf('%s\n','--(It really depends on what year you are thinking about though!)')
    fprintf('%s\n','--I might not be born yet or even dead you know?(Hopefully not dead thoguh)')
    fprintf('%s\n','------P.S. : D. B if you are reading this I hope you do not deduct points from me -_-');
    fprintf('%s\n','The number of days since the begging of the year including this day is', nd);
elseif mo == 10 && da == 30
    
     fprintf('%s\n','Happy BirthDay Meghan! :D ');
    fprintf('%s\n','--(It really depends on what year you are thinking about though!)')
    fprintf('%s\n','--you might not be born yet or even dead you know?(Hopefully not dead thoguh)')
    fprintf('%s\n','------P.S. :Dogs are AWEOSEME');
    fprintf('%s\n','The number of days since the begging of the year including this day is', nd);
    
else
   fprintf('The number of days since the begging of the year including this day is')

end

end