function [r,t] = projectile(v0,angle) 
% PROJECTILE using initial velocity (v0) in m/s and initial launch angle
% (angle) in degrees calculate the range (r) in meters and time of flight
% (t) in seconds 

if nargin ~= 2 
    error("projectile only accepts two input values for v0 and angle")
end

% define constants used in projectile motion 
g = 9.8; % measured in m/s^2 

% identify error cases for each of the measurements obtained 
if ~isnumeric(v0) || ~isnumeric(angle) 
    error("Initial velocity and launch angle must be numerical values.") 
end

if angle <= 0 || angle >= 90 
    error("Launch angle must be between 0 and 90 degrees.") 
end 

% identify equations for inital velocity of projectile 

v0x = v0*cosd(angle); % measured in m/s 
v0y = v0*sind(angle); % measured in m/s 

% identify kinetmatic equations 

% t = time of flight
t = (2 * v0y) / g;
% r = range 
r = v0x * t;

end 

function ms = mph2mps(v)
% MPH2MPS convert velocity (v) from miles per hour to meters per second

ms = v*(1609.34/3600); 

end 



