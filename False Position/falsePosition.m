
function [root,fx,ea,iter] = falsePosition (func,xl,xu,es,maxiter)
%HOMEWORK 9 - MECH 105
%Abdulla Al Ameri
%Due Date: 19th, Feb, 2018
%---------------------------
%
%falsePosition Funciton will try to esitmate a root of a given function
%and given upper, and lower estimate for the root. This function will run
%for a certain number of iterations and desried error.
%
%---------------------------
%
%Note: When calling the function, make sure to define a symbolic function
%using syms function that's built in MatLab, define a function, t
%
%---------------------------
%INPUTS:
%       func - the function being evaluated
%       xl- the lower guess
%       xu- the upper guess
%       es - the desired relative error (should default to 0.0001%)
%       maxiter - the number of iterations desired (should default to 200)
%-----------------------
%OUTPUTS:
%
%       root - the estimated root location
%       fx - the function evaluated at the root location
%       ea - the approximate relative error (%)
%       iter - how many iterations were performed
%
%---------------------------
%Quote of the Code:
%
% 01000011 01101111 01101110 01110011 01110100 01100001 01101110 01110100
% 00100000 01100100 01100101 01110110 01100101 01101100 01101111 01110000
% 01101101 01100101 01101110 01110100 00100000 01101001 01110011 00100000
% 01110100 01101000 01100101 00100000 01101100 01100001 01110111 00100000
% 01101111 01100110 00100000 01101100 01101001 01100110 01100101 00101100
% 00100000 01100001 01101110 01100100 00100000 01100001 00100000 01101101
% 01100001 01101110 00100000 01110111 01101000 01101111 00100000 01100001
% 01101100 01110111 01100001 01111001 01110011 00100000 01110100 01110010
% 01101001 01100101 01110011 00100000 01110100 01101111 00100000 01101101
% 01100001 01101001 01101110 01110100 01100001 01101001 01101110 00100000
% 01101000 01101001 01110011 00100000 01100100 01101111 01100111 01101101
% 01100001 01110011 00100000 01101001 01101110 00100000 01101111 01110010
% 01100100 01100101 01110010 00100000 01110100 01101111 00100000 01100001
% 01110000 01110000 01100101 01100001 01110010 00100000 01100011 01101111
% 01101110 01110011 01101001 01110011 01110100 01100101 01101110 01110100
% 00100000 01100100 01110010 01101001 01110110 01100101 01110011 00100000
% 01101000 01101001 01101101 01110011 01100101 01101100 01100110 00100000
% 01101001 01101110 01110100 01101111 00100000 01100001 00100000 00101000
% 01100110 01100001 01101100 01110011 01100101 00100000 01110000 01101111
% 01110011 01101001 01110100 01101001 01101111 01101110 00101001 00101110
%
% 01000111 01101000 01100001 01101110 01100100 01101001



%Setting up intial conditions:

    % if I user didn't determine max iterations it will be deadfult to 200
    % if I user didn't determine relative error it will be default to 0.0001%
    % Error will be shown in case more arguments or less than the limit
    
    
if nargin == 4
	maxiter = 200;

elseif nargin == 3
    
    maxiter = 200;
    es = 0.0001;

elseif nargin < 3 || nargin > 5

    error('This function requires at least 3 inputs and no more than 5. Check help.')

end


% The first iteration is performed already jsut to create intial guess.


fx = func;
Oldroot = double(((xu*fx(xl)) - (xl*fx(xu)))/((fx(xl))-(fx(xu))));
ea = es+1;
iter = 1;
        


%The code will check if there's sign change, set a new lower or upper limit
%Then find a line between them and find where it crosess 0, and cacluate
%the error, and add 1 to the number of iterrations.

%The code will run to either a certain error or number of irrtations.


if sign(fx(xu) * fx(Oldroot)) == -1
    while maxiter > iter && ea >= es
        xl = Oldroot;
        root = double(((xu*fx(xl)) - (xl*fx(xu)))/((fx(xl))-(fx(xu))));
        ea = (((root)-(Oldroot))/(Oldroot))*100;
        iter = iter + 1;
        Oldroot = root;
    end
else
    while maxiter > iter && ea >= es
        xu = Oldroot;
        root = ((xu*fx(xl)) - (xl*fx(xu)))/((fx(xl))-(fx(xu)));
        es = (((root)-(Oldroot))/(Oldroot))*100;
        iter = iter + 1;
        ea = es;
        Oldroot = root;
    end
end


%Show the results to the user.


fprintf('%s\n','The function is:', char(fx));
 fprintf('%s\n','The approximate relative error:', num2str(ea));
fprintf('%s\n','The number of iterations performed:', num2str(iter));

end