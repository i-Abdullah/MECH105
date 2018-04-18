function Matri = RatioMat (n,m)
%HOMEWORK 5 - MECH 103
%Abdulla Al Ameri
%Date: 30, January, 2018
%---------------------------
%FUNCTION FEATURES:
%
%This function (RatioMat) returns an n x m matrix with elements that have the
%following values
%   1) The value of each element in the first row is the number of the column.
%   2) The value of each element in the first column is the number of the row.
%   3) The rest of the elements each has a value equal to the sum of the
%   element above it and element to the left.
%
%---------------------------
%
%The function will return an error if the user does not exactly input 2
%arguments
%
%---------------------------
%INPUTS:
%       n - Number of raws
%       m - Number columns
%   
%-----------------------
%OUTPUTS:
%       n x m matrix that has "FUNCTION FEATURES"
%---------------------------


%If user inputs more than 2 arguments error massage will show up!

if nargin ~= 2
    error('WatchOut! Only 2 Inputs allowed, first  number of raws, then number of columns');
end

% h is a vector that has the number of rows
% k is a vector that has the number of columns

for h = 1:n;
    for k = 1:m;
         if k == 1;
        Matri (h,k) = h;
         elseif h == 1;
        Matri (h,k) = k;
         else
        Matri (h,k) = Matri(h-1,k) + Matri(h,k-1) ;  
    end
   
    end

end