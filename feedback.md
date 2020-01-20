## Jan 20
Your `gravitation` script does run and produce the correct results for height, but it is still missing
1. comments about the questions posed in Problem 2.
1. the functionality of taking `T` from the command line - please look at the function `input`
1. the correct velocity calculation
Now, you should look at line 10 and ask yourself how this affects the calculation at line 12, do you see a problem. On another note, try using `table(v',h')` instead of `table(v,h)` on line 15.
