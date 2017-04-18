# Countdown-Numbers-Game
## *Theory of Algorithms Project 2017*

**Name:** Pawel Borzym </br>
**College:** Galway-Mayo Institute of Technology </br>
**Course:** Software Development </br>
**Module:** Theory of Algorithms </br>
**Lecturer:** Dr.Ian Mcloughlin </br>
**Lang:** Racket

#Project Overview
As part of Theory of Algorithms module we have been asked to re-create a very popular Countdown Numbers Game in Racket Functional programming language. Countdown first aired on British Channel 4 in 1982. </br>
During the number part of the game the contestants had to combine 6 randomly selected numbers to get as close as possible to a randomly generated total. </br>
Note that the contestants were using just the 4: **+ - / x** arithmetic operators. 

##Permutations of Numbers
6 Numbers will equal to 720 possible permutations

##Cartesian Product
Example of cartesian product of 4 operators and 5 numbers in this situation
```
A×BA×B == {+,−,/,∗}×{1,2,3,4,5}{+,−,/,∗}×{1,2,3,4,5} ==  {(+,1),(+,2),(+,3),(+,4),(+,5),(−,1),(−,2),(−,3),(−,4),(−,5),(/,1),(/,2),(/,3),(/,4),(/,5),(∗,1),(∗,2),(∗,3),(∗,4),(∗,5)}
```
Using cartesian-product only, the length of list of 5 operators: **+ - * /**  ( +1 generated by cartesian product) is
```
1024
```


### More on WIKI
[Countdown Game Wiki](https://github.com/PawelBor/Countdown-Numbers-Game/wiki) - My wiki for this project.
Contains most of my thoughts throughout the development process.<br>
Headings and what information is provided there.

1. Home
2. Logic Used
3. Problems Encountered
4. References
5. Research
6. Rules of the Game
