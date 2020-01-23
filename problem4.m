load('smallperiodictable.mat')

%find all densities greater than 1 g/cm^3
n = names(density >1)
size(n,1)

%find all elements with isotopes over 100 
e = names(isotopes > 100)
size(e,1)

%find number of elements discovered before 1900 
discovery = names(discyear < 1900)
size(discovery,1)

%plot function that expresses relationship between atomic weight and density

plot(atomicweight,density,"LineWidth",3)
title('atomic wieght vs. density') 

%there does not exist a direct linear relationship between the varibales
%produced within the function, the data itself fluctuates rather than being
%constant 


