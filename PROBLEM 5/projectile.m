function [r,t] = projectile(vi,angle,h0,vunit) 
% PROJECTILE using initial velocity (vi) in m/s, initial launch angle
% (angle) in degrees, and initial height (h0) in meters 
% calculate the range (r) in meters and time of flight
% (t) in seconds 

switch nargin 
    case 2
        v0 = vi;
        h0 = 0;
    case 3
        % vunit is considered by default m/s if not provided 
        v0 = vi;
    case 4
        switch vunit
            case "mph"
                v0 = mph2mps(vi);
            case "mps"
                v0 = vi;
            otherwise
                error("Invalid unit of measurement for velocity")
        end
    otherwise
        error("projectile only accepts three input values for v0, angle, and h0")
end

% define constants used in projectile motion 
g = 9.8; % measured in m/s^2 

% identify error cases for each of the measurements obtained 
if ~isnumeric(v0) || ~isnumeric(angle) || ~isnumeric(h0)
    error("Initial velocity, launch angle, and initial height must be numerical values.") 
end

if angle <= 0 || angle >= 90 
    error("Launch angle must be between 0 and 90 degrees.") 
end 

if h0 < 0
    error("Initial height must be a positive value.")
end

% identify equations for inital velocity of projectile 

v0x = v0*cosd(angle); % measured in m/s 
v0y = v0*sind(angle); % measured in m/s 

% identify kinetmatic equations 

% t = time of flight
% tu = time in upwards flight
% tc = time in downwards flight
tu = v0y / g;
tc = sqrt((2*h0)/g + (v0y)^2/g^2);
t = tu + tc; 

% r = range 
r = v0x * t;

end 

function ms = mph2mps(v)
% MPH2MPS convert velocity (v) from miles per hour to meters per second

ms = v*(1609.34/3600); 

end 

function Graph 
% plot distance versus time 
t = [0,tu];
h = h0 + v0y*t - (g*t^2)/2; 
plot(t,h)
xlabel('time(s)') 
ylabel('postion(m)') 
title('trajectory of projectile') 
end 

