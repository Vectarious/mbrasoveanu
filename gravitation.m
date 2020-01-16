%Input 
T = 90:10:130 ; 
% Define constants: earth radius, G, earth mass
R = 6.371*10^6; 
G = 6.67*10^(-11); 
M = 5.98*10^(24); 

T = T*60; % convert to sec 
h = (G*M*(T.^2)/(4*pi^2)).^(1/3) -R; %height in meters
h = h/1000

v = sqrt((G*M)./(R+h))
v = round(v) 
h = round(h)
x = table(v,h)



 

