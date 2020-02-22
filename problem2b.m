%this function calculates altitude h the satelite must have above Earth's surface

reply = input('Please enter period T in seconds, minutes, hours or days\n in format PERIOD<space>UNIT \n for example: \n3600 sec or \n60 min or \n1 hr or \n1 days\nperiod: ', 's');
disp(reply)

% applying split function, split T to y 
y = split(reply);
% first value of y to be 'z'
period = y{1}; 
% second value of y to be 'units' 
unit = y{2}; 

% turn 'period' from a string to a number 
T = str2num(period);
% verify that the 'period' is a non-infinite positive integer
% ~isempty(x) && isnumeric(x) && isfinite(x) && x > 0 && x == floor(x)
if isempty(T) || ~isnumeric(T) || ...  % not a number
   ~isfinite(T) || ...  % infinite
   T <= 0 || ...   % negative
   T~=floor(T)   % not integer 
    error("Period must be a positive integer.")
end


% unit conversions for period T to seconds 
switch lower(unit) 
    case 'sec' 
        T = T; 
    case 'min' 
        T = T.*60; 
    case 'hr' 
        T = T.*3600; 
    case 'days' 
        T = T.*86400; 
    otherwise 
        error("Period must be measured in one of the following units: 'sec', 'min', 'hr', 'days'") 
end  

% Define constants: earth radius, G, earth mass

R = 6.371*10^6; % meters
G = 6.674*10^(-11); % m^3/(kg*s^2)
M = 5.972*10^(24); % kilograms
  
h = (G*M*(T.^2)/(4*pi^2)).^(1/3) -R; % height in meters
h = h/1000; % height in kilometers

if h<0 
    error("Altitude cannot be negative.") 
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
