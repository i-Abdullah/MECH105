%% Problem: We have a tank made of a cylinder and a cone, and as we fill 
% it with water we wanna know the volume of water does it contain.

clear
clc

INP = input ('Eneter the hight of the water in meters')

    
if INP <= 0 || INP >= 33
    error('ERROR: Your hight cannot be negative, or 0, nor it can exceed 33 meters')
elseif INP <= 19
    
    h = INP
    WATER_VOLUME = pi * (12.5)^2 * h
    fprintf('%s cubic meter is the volume of the water.\n',WATER_VOLUME)
else
   h = 19
   H = INP - 19
   WATER_VOLUME = (pi * (12.5)^2 * h) + (1/3 * pi * (23)^2 * H)
   fprintf('%s cubic meter is the volume of the water.\n',WATER_VOLUME)
    
end
