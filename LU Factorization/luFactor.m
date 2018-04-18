function [L,U,P] = luFactor(A)
%HOMEWORK 15 - MECH 105
%Abdulla Al Ameri
%Due Date: 26th, March, 2018
%---------------------------
%
%luFactor is a function that gives you the upper, lower, and pivoting
%matrix for an n X n matrix.
%
%---------------------------
%
%INPUTS:
%       A - n x n matrix represent coefficients of a function
%
%-----------------------
%OUTPUTS:
%
%       L - Lower triangular matrix
%       U - Upper triangular matrix
%       P - The Pivot Matrix
%
%---------------------------




%______________________________Cheking validity of inputs________________________________%
%

if isempty(A);
    error('You Must have a n x n matrix input!')
end

%Note:Matlab Itself will take care of Nargin.

%________________________________________________________________________________________%

dem = size(A); %Getting the Deminsions of the inputed vector
raws = dem(1,1); %Getting the Number of Raws
columns = dem(1,2); %Getting the Number of Columns



%______________________________Cheking the deminsions of inputs__________________________%


if raws ~= columns
    
    error('Matrix Deminsnions must be equal ( n X n matrix ), check help!')
    
end

%______________________________Creating the outputs______________________________________%


L = eye(raws); %Lower triangular matrix
P = eye(raws); %Pivot matrix
U = A; %Upper triangular matrix


%___________________________________Pivoting_____________________________________________%

for i = 1:raws
        
        PivElm = max(abs(U(i:raws,i))); %finding the absloute max vlue
        [r,c] = find(U==PivElm); %Locating the max value
        
        if isempty(r());
        [r,c] = find(U==PivElm*-1); %looking if the max is negative value and lcoating it
        end
        
%sometimes if the same max happens to be in more than one place MatLab will
%store all the raws in one vector and all the  columns in another one, so a
%flip function will be used so that we can get the loactions in the right
%order because Matlab stores them from the last to the first and we only
%want the first.
        
        r = flip(r);
        c = flip (r);
        r = r(1,1);
        c = c(1,1);
        
%{    Storing Each raw in diffrieint aray then swap them in P,U    }%
        
        Replace = U(r,:); %The raw we will replace in U that corresponds to the Max
        
        ReplaceW = U(i,:); %The raw we will replace it with in U
        
        ReplaceP = P(r,:); %The raw we will replace in P that corresponds to the Max
        
        ReplaceP_W = P(i,:); %The raw we will replace it with in P
        

%{     Do the Pivoting     }%

        U(i,:) = Replace;
        U(r,:) = ReplaceW;
        P(i,:) = ReplaceP;
        P(r,:) = ReplaceP_W;

        
%{ The following code is for pivoting L }%

%{ we using if loop because we won't pivot in the first iteration }%

        if i==1 
            []; %Do Nothing the first iteration
            
        else
            
        ReplaceL = L(r,i-1); %The raw we will replace in L that corresponds to the Max
        
        ReplaceL_W = L(i,i-1); %The raw we will replace it with in L

        %Do the pivoting
        
        L(i,i-1) = ReplaceL; 
        
        L(r,i-1) = ReplaceL_W;
            
        end

%______________________________Forward Eliminating_______________________________________%

        
       for j = i:columns-1;
           
        PivCoeff = U(j+1,i) / U(i,i);
%Divide the number in the cell below the diagonal over the value of the diagonal cell in U

        L(j+1,i) = PivCoeff;
%Store it in L.
        
        Multiplier = PivCoeff .* U(i,:);
%Multiplie it by the diagonal raw

        NewRaw = U(j+1,:) - Multiplier;
%Substract from the raw you want to eliminate
        
        U(j+1,:) = NewRaw;
%Replace the raws
        
       end
        
    end
    

end