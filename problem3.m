c = load('p3.mat')
v = c.v
u = c.u
A = c.A

v.*u
v*u'
v'*u
u/v
u./v

%{ 
error in the following matrix multiplication operation 
because of dimensions mismatch:
5 - num of columns of A 
1 - num of rows of u

A*u; 


%}

A.*u
A*v'

A^2 
A.^2

%{
.^ gives the 'element wise power', meaning that each element of A is raised
to the corresponding power in A 
^ gives the 'matrix power' , meaning that this computes A to the A power, 
in other words equivalent to A*A 
%}

 x = zeros(1,100) 
 for n= 0:99
     i = n+1 
     x(i) = sqrt(12)/((-3)^n*(2*n+1))
 end
 
 disp(x)
 
 sum(x,'all')
 

