# adventofcode
As every year I'm trying to do the [advent of code](https://adventofcode.com/) but this time I'm challenging Lille SUP English EMSE students !

I usually give up around the middle of the event ; let's see how far we can go :-)

## Day 1
For the first puzzle we studied everything that is needed to accomplish it (file processing, type cast, loop through words, etc.).

I banged my head more than an hour on the second puzzle... Indeed I didn't cover the case where `2sevenjqv9oneight` converts in `2718` and not in `271` (the sample data didn't conver that use case).

I'm not sure we can solve it without [a regular expression](https://docs.python.org/3/library/re.html).


## Day 2
Ruby's [Enumerable](https://ruby-doc.org/3.2.2/Enumerable.html) is my favorite object ever !

## Day 3
Epic fail ! The sample dataset works but not the big file ; can't find why :-(
Update : I probably have an error where I get the index of the scanned number in case there are two instances of the same number on the same line

## Day 4
1st puzzle super easy thanks to the [intersection operator](https://ruby-doc.org/3.2.2/Array.html#method-i-26) on the array.

2nd puzzle has two implementations, a litteral one that is way to slow or math one.

## Day 5
WIP

## Day 6
The brute force calculation is easy to find the winning race.

If we were to calculate the optimum without computing all values, a quadratic equation would be the best.


## Day 7
Quick and dirty, puzzle 1 only