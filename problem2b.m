
reply = input('Please input a single value or the range of period T in seconds, minutes, hours \n start:step:end (for example 90:10:130).. ');
disp(reply)
T = reply
% applying split function, split T to y 
y = split(reply);
% first value of y to be 'z'
z = y{1}; 
% second value of y to be 'units' 
units = y{2}; 
% turn 'z' from a string to a number 
T = str2num(z) 
 
%five numbers given as Input 
%this function calculates altitude h the satelite must have above Earth's
%surface 
%T = 90:10:130 ; % min

% Define constants: earth radius, G, earth mass

R = 6.371*10^6; % meters
G = 6.674*10^(-11); % m^3/(kg*s^2)
M = 5.972*10^(24); % kilograms

% verify that the period T is a number 
if ~isnumeric(T)
    error("must be number")
end
% unit conversions for period T 
switch unit 
    case 'Seconds' 
        T = T; 
    case 'Minutes' 
        T = T.*60; 
    case 'Hours' 
        T = T.*3600; 
    case 'Days' 
        T = T.*86400; 
    otherwise 
        error("period must be measured in the following units: 'Seconds', 'Minutes', 'Hours', 'Days'") 
end 


T = T*60; % convert to sec  
h = (G*M*(T.^2)/(4*pi^2)).^(1/3) -R; % height in meters
h = h/1000; % height in kilometers

if h<0 
    error("period is too small") 
end 
%{
1. Given that it is required to calculate the altitudes of the satelites, 
there is a simplified version in which the calculations can be executed for
when the period, T is 90 min and 45 min respectively. A vector can be
created that ranges from 0:45:90, by doing this, then all desired values of
T will be calculated at those respective time intervals. 

2. A geosynchronous orbit has an orbital period that matches the rate at
which the Earth rotates. The time period that it takes for Earth to rotate
once about its polar axis relative to a distant fixed point. A solar day
varies because of its synchronous orbit passing by any given point with the
solar local time. This is essential when the light and sun angle are
measured. 
%}

v = sqrt((G*M)./(R+h)); %velocity in meters per second
v = round(v) 
h = round(h)
x = table(v',h')
disp(x)

% apply function command, units are different variables that are part of
% the funtion 