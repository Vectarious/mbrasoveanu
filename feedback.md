## Jan 20
Your `gravitation` script does run and produce the correct results for height, but it is still missing
1. comments about the questions posed in Problem 2.
1. the functionality of taking `T` from the command line - please look at the function `input`
1. the correct velocity calculation
Now, you should look at line 10 and ask yourself how this affects the calculation at line 12, do you see a problem. On another note, try using `table(v',h')` instead of `table(v,h)` on line 15.

## Jan 27
Problem 2's modifications are noted, and they look good. The only thing that is left is to get the velocity calculation correct. The problem starts on line 17 in `gravitationinput.m`
I can't run problem 3, did you forget to include something?
I just added the table for problem 3 onto my repository, the program should be able to run now.

## Feb 3
Program 3 runs now, but you have to take the lesson you should have learned in problem 3 and apply it to problem 4 - because I cannot run any of those programs. What's missing?

For problems 4,4a,4b, I added "smallperiodtable.mat", "GlobalTempybyYear.txt", and "GlobalCarbonBudget2018.xlsx" files. The following programs should be able to run now. 

## Feb 9
Problem 3 and 4 are running now. Problem 4a/climate program are hitting some problems still - there are minor mistakes in that code, double check that the file you're referencing is the same as the one in the folder (spelled the same way and everything). Minor details, but details are everything.

For Problem 4a I have added the 'smallperiodictable.csv' file that should allow the program to work entirely. In addition, I have completely updated problem 4b with its corresponding files. 

For Problem 2b I'm not sure what variable needs to be addressed for applying the split function. I thought it was whatever is defined as input. 

## Feb 18
Problem 4/4a look good (Though I think you made a slight error on the floating density condition, talk to me on Thursday about that). Problem 4b has 1 tiny mistake still, but otherwise would be working as far as I can tell - look at the file name in the folder and then the file name in your program. For 2b, I think you have the right idea, I would look at the documentation for `input`, and then delete the line `T=reply` that is actually doing nothing. The split function should take the input, true, but then split gives you a cell array, and then you deal with that fine - you have a error in your `switch statement` however. There's a few points in this program that might be giving you trouble, can you be more specific as to the problem you're having?

I have completed and uploaded problem 2b with the corrections we talked about on Thursday. 

I have uploaded problem 5, the only trouble I keep seeming to have is how to incorperate my unit conversion function into my projectile function. 

## Feb 24
2b is looking better, you now take the input as a string and deal with that as a whole, but you still have some unit problem in here, it happens on line 46. What happens there and then what do you do after that? Projectile is coming along, it works now for starting and stopping at h=0, you'll have to modify that when you incorporate an initial height. As far as the choice of units, take the easiest path - incorporate the units as a separate input argument (and specify a default value for it). Don't try to take the velocity as a string and then try to split it, this doesn't make much sense in functions since you are putting separate arguments into it already.

Problem 2b: I went over the program, and I debugged it. I didn't seem to come across any conflict in terms of the unit conversion. When I initially uploaded the program to GitHub, I think that I posted a version before the correct final saved one. 
Problem 5: I incorporated a new input variable for the function which is the initial height. I did this by applying the switch command for the different cases across the program. Aditionally, I added the graph for the trajectory of the projectile. 

## Mar 9
Looking at prob 2b, you may have uploaded the wrong version, but you still have a unit error in your program, Problem2b.m (at least the version I have) On line 71 you calculate the velocity using `h` (in km from line 55) and `R` (in meters from line 45). Am I missing something?
The projectile program, though is good, I get the correct answers and the default arguments are working as encoded. The one thing that isn't in the program is the graph - you have a function that would graph the results, but it is never called.
