
%Input
T =input('Input the bodys orbital period in minutes:  ');
% Define constants: earth radius, G, earth mass
R = 6.371*10^6; 
G = 6.67*10^(-11);
M = 5.98*10^(24);
if ~isnumeric(T)
    error("must be number")
end
T = T*60; % convert to sec
hm = (G*M*T^2/(4*pi^2))^(1/3)-R; % height in meters
vm =  sqrt(G*M./(hm+R));
format bank
hkm = hm/1000 % convert h to km
vkm = vm/1000 % convert v to km/s

%Input 

t = input('Please input a single value of time t in seconds: ');
% Define constants: graviational acceleration g, initial positions  
g = 9.81 % gravitational acceleration in m/s^2 
x0 = 0 % measured in meters 
y0 = 0 % measured in meters 

if ~isnumeric(t)
    error("must be number")
end

function [x,y] = % trajectory (x,time)
Vx = v0*cosd(theta) 
Vy = v0*sind(theta)
V = sqrt((Vx)^2 + (Vy)^2) % measured in meters per second 
x = x0 + v*cosd(theta)*t % measured in meters 
y = y0 + v*sind(theta)*t % measured in meters 







% function [x,y] = trajectory (a,time)
% x0 = 0 
% y0 = 0 
% g = 9.81 
% x = x0 + v*cos(theta)*t 
% x = x0 + v*cos(d)*t (for degrees) 
% y = y0 + v*sin(theta)*t - (gt.*^2)/2 
% end 
% we want launch anlge, initial velocity, horizontal distance, time flight
% of projectile 