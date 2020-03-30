function [varargout] = ptable(varargin)
%  PTABLE is a function that is able to take 0-2 arguments. When there is no
% argument, the program produces two functions. One of the two functions has 
% two lines - mass(calculated by semi-emperical formula) versus the atomic number 
% and mass (calculated from atomic weight) versus the atomic number. The second 
% function expresses binding energy per nucleon versus atmoic number. When there 
% is 1 numerical argument is taken,two numerical arguments are expressed; the 
% mass given by the element (from semi-emperical mass formula) and a table containing 
% the information about the element. When the function takes in 2 numerical arguments, 
% the program returns two outputs; the mass of the isotope and the stability. 
% When one numerical argument and char argument are taken, the mass of the element 
% and the value within that field are returned.
%read 'periodictabledata.csv' file 

PDATA = readtable('periodictabledata.csv');

    function [mass, ri] = massformulaByZ(argZ)
        %Define variable for row of input 
        ri = find(PDATA.AtomicNumber==argZ);
    
        %Define variable for row of Atomic Number 
        nestA = PDATA.AtomicWeight(ri); 
    
        %Calculate mass using given function
        mass = massformula(nestA, argZ);
    end

if nargin == 0 
    % extracting the Atomic Weight and Atomic Number from the given input
    TA = PDATA.AtomicWeight; 
    TZ = PDATA.AtomicNumber;  
    am_unit = 931.5; %measured in MeV 
    % apply unit conversion
    AWMASS = TA*am_unit;  
    params = table(TA, TZ);
    % apply massformula to the entire set of Atomic Weight and Atomic Number 
    SefResults = rowfun(@massformula, params,...
        'OutputVariableNames', ...
        {'Mass' 'BindingEnergy' 'BindingEnergyPerNucleon'}); 
    
    figure(1)
    
    hold on
    % use red (r) solid line (-)
    plot(TZ,SefResults{:,{'Mass'}},'r-');
    % use green (g) plus line (+)
    plot(TZ,AWMASS,'g+');
    xlabel('Atomic Number') 
    ylabel('Mass (MeV)')
    title('Mass vs. Atomic Number') 
    legend('r = semi-emp formula mass vs. atomic number',...
        'g+ = atomic weight vs. atomic number') 
    hold off 
    
    figure(2) 
    plot(TZ,SefResults{:,{'BindingEnergyPerNucleon'}})
    xlabel('Atomic Number')
    ylabel('bepn (MeV)')
    title('BEPN vs. Atomic Number') 
    
    varargout{1} = table(TZ,SefResults{:,{'Mass'}},AWMASS,'VariableNames',...
        {'AtomicNumber','MassMeV','AtomicWeight'});
    varargout{2} = table(TZ,SefResults{:,{'BindingEnergyPerNucleon'}},...
        'VariableNames',{'AtomicNumber','bepnMeV'})
   
%if one argument is numeric    
elseif nargin == 1
    %verifying that input is numeric 
    arg1 = varargin{1};
    if ~isnumeric(arg1)
        error('Please input numerical value for Atomic Number')
    end 
    %verifying that input is greater than or equal to 1 but less than or
    %equal to 112 
    if arg1 < 1 || arg1 > 112
        error('Please input a value that is inbetween 1 and 112')
    end 
    
    Z = arg1;
    
    [mass, RowIndex] = massformulaByZ(Z);
    % input table with atomic numbers
    OUTTABLE = PDATA(RowIndex,:);
    disp(OUTTABLE)
    disp("Atomic Mass = " + mass + " MeV ")

    varargout{1} = mass;
    varargout{2} = OUTTABLE;
    
%if both input arguments are numeric     
elseif nargin == 2 
     arg1 = varargin{1};
     arg2 = varargin{2};
    
%verifying that the inputs for both the atomic number and the number of 
%nucleons is numeric 
    if ~isnumeric(arg1)
        % argument 1 is not numeric - should raise error
        error('Please input numerical value for atomic number') 
    end
     % argument 1 is numeric
    if ~isnumeric(arg2)
        % argument 2 is not numeric - will answer case 4
        % check that numericarg2 value is in the set of field names of
        % PDATA
        if ~ismember(arg2, PDATA.Properties.VariableNames)
            error('Invalid field name in the second argument')
        end
        
        Z = arg1;      
        ColumnName = arg2;
        
        [mass, RowIndex] = massformulaByZ(Z);
        FieldCellArray = PDATA{RowIndex, ColumnName};
        FieldValue = FieldCellArray{1, 1};
        
        varargout{1} = mass; 
        varargout{2} = FieldValue;
    else
        % argument 2 is numeric - will answer case 3
        % defining variables A and Z for calculations 
        A = arg1; 
        Z = arg2;

        %calculate the stability of the isotopes 
        [mass,be,~] = massformula(A,Z); 
        disp("Atomic Mass = " + mass + " MeV ")
        varargout{1} = mass;

        if be > 0
            disp('Isotope is stable')
            varargout{2} = 'stable';
        else
            disp('Isotope is unstable')
            varargout{2} = 'unstable';
        end
        
    end
end

end % function
    
%%
function [mass, be, bepn ] = massformula(A,Z)
%MASSFORMULA calculates the mass of an atomic nuclei with Z protons and A-Z
%neutrons using the semi-empirically mass formula (units in MeV), and
%outputs the MASS (in MeV), BE (binding energy), and BEPN (binding energy per nucleon)
% Quantities in MeV/c^2
mp = 938.27;
mn = 939.57;
av = 15.8;
as = 18.3;
ac = 0.714;
aa = 23.2;
ap = 11.2;

format bank

be = (av*A) - (as*A^(2/3)) - (ac*Z*(Z-1))/(A^(1/3))-(aa*(A-2*Z)^(2))/A;
% the next if statements don't work, the percent signs are trying to mod A
% and mod Z, but you need to look up the syntax and figure out what is
% going on below. Or we could do it together in class on 2/11
if mod(A,2)==0
    if mod(Z,2)==0
        be = be + ap/sqrt(A);
    else
        be = be - ap/sqrt(A);
    end
end
bepn = be/A;
mass = Z*mp+(A-Z)*mn-be;
end