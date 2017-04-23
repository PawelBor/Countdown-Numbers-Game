# Countdown-Numbers-Game
## *Theory of Algorithms Project 2017*

**Name:** Pawel Borzym </br>
**College:** Galway-Mayo Institute of Technology </br>
**Course:** Software Development </br>
**Module:** Theory of Algorithms </br>
**Lecturer:** Dr.Ian Mcloughlin </br>
**Lang:** Racket

# ReadMe Structure
* Technologies Used
* How to Run + required software
* Project Overview
  * Permutations of Numbers
  * Cartesian Product
* Algorithm
* Actual Results (ScreenShots)
* **More on WIKI**
* References

# Technologies Used

| Technology | Description |
| ------------- |:-------------|
| **GitHub**      | GitHub is a web-based Git or version control repository and Internet hosting service. It offers all of the distributed version control and source code management functionality of Git as well as adding its own features. Esentially used to document all the changes and steps that were taken during the development of the project. Containing ReadMe, few Issues and Wiki for the reposityory. |
| **DrRacket**      | DrRacket is a graphical IDE that's integrated with Racket's vast documentation. It was used to write and execute the code and total development.      |
| **Git** | Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency. It was esentially used to communicate with my GitHub repository, store changes and push the changes to the repository as a commit.      |


# How to Run + required software
For this project I've used DrRacket as IDE of my choice, comes with integrated Racket documentation which was great.<br>
It is definitely not a requirement to use it but it works very well and is user friendly.<br>

*Essentially this is plug & play without any input requirement from the user as it uses Random List of Numbers and Random Target Number, this can simply be avoided by using your own list & target number rather than using the generated ones. This will be described in the following steps.*<br>

1. Make sure you have IDE that supports runnign racket scripts. (***DrRacket in this case***)
2. Download this repository or just copy & paste the contents of **numbersGame.rkt** file.
3. Open DrRacket (or your IDE) and Import the numbersGame.rkt file by clicking File option if you decided to download the repository **OR** simply paste in the code into the DrRacket window if you decided to choose this way.
4. Now click **RUN** in the Top-Right corner of DrRacket and wait for result to show. 
5. Result will appear with all the results.

# Project Overview
As part of Theory of Algorithms module we have been asked to re-create a very popular Countdown Numbers Game in Racket Functional programming language. Countdown first aired on British Channel 4 in 1982. </br>
During the number part of the game the contestants had to combine 6 randomly selected numbers to get as close as possible to a randomly generated total. </br>
Note that the contestants were using just the 4: **+ - / x** arithmetic operators. 

## Permutations of Numbers

***In mathematics, the notion of permutation relates to the act of arranging all the members of a set into some sequence or order, or if the set is already ordered, rearranging (reordering) its elements, a process called permuting.[1]***

The requirement for this program to work is to have every possible permutation of the 6 randomly selected numbers form a parent list.
To find out how many ways there is we can simply check this using maths.<br>
**Factorial:** 
```
6! = 6 * 5 * 4 * 3 * 2 * 1
6! = 720
```
This shows that there will be 720 permutations of a list of 6 numbers. Luckily Racket provides us with library and all we need to do is simply use the built-in function.
```
(define permList (permutations (list 1 2 3 4 5 6)))
```

## Cartesian Product


 ***Cartesian product is a mathematical operation that returns a set (or product set or simply product) from multiple sets. That is, for sets A and B, the Cartesian product A × B is the set of all ordered pairs (a, b) where a ∈ A and b ∈ B. Products can be specified using set-builder notation, e.g. [2]***
 
 ```
 A X B = {(a,b) | a ∈ A and b ∈ B}
 ```


Example of cartesian product of 4 operators and 5 numbers in this situation
```
A×BA×B == {+,−,/,∗}×{1,2,3,4,5}{+,−,/,∗}×{1,2,3,4,5} ==  {(+,1),(+,2),(+,3),(+,4),(+,5),(−,1),(−,2),(−,3),(−,4),(−,5),(/,1),(/,2),(/,3),(/,4),(/,5),(∗,1),(∗,2),(∗,3),(∗,4),(∗,5)}
```
The purpose of **cartesian product** for this program was to "make" 5 operators out of 4 available operators.<br>
The way I have achieved this is using the code below.
 ```
 (define ops '(+ - / *))
(define all-ops(cartesian-product ops ops ops ops ops))
```
This will generate a list of lists of operators and the length of parent list will equal to ***1024***.<br>
Sample of what is returned.
```
'((+ + + + +)
  (+ + + + -)
  (+ + + + /)
  (+ + + + *)
  (+ + + - +)
  (+ + + - -)
  (+ + + - /)
  (+ + + - *)
  (+ + + / +)
  (+ + + / -)
  (+ + + / /)
  (+ + + / *)
  (+ + + * +)
  (+ + + * -)
  (+ + + * /)
  (+ + + * *)
  (+ + - + +))
```
As we can see the sample provides of 17 lists of operators generated using cartesian product and the 17 lists are within 1 parent list.<br>
This is very important and has caused me to struggle to understand what was going on.

### Algorithm
Now that there is all necessary data to make an equation it must be used somehow.<br>
This program works as follows:<br>
The ***opseq*** function makes up an equation by using a list of operators that was generated by using cartesian product then using that list it will do 720 equations by using all permutations of the 6 numbers.<br>
***example***

| Type       | Description |
| ------------- |:-------------|
| all-ops       |   '(+ + + + +) (+ + + + -)...)        |
| permList      |   '((1 2 3 4 5 6) (2 1 3 4 5 6) (1 3 2 4 5 6)...)   |

```
(+(+(+(+(+ 1 2)3)4)5)6)
(+(+(+(+(+ 2 1)3)4)5)6)
(+(+(+(+(+ 1 3)2)4)5)6)
... all the way untill the end... 720
```

This way I'm covering every single equation for ** ( + + + + + )**.<br>
This process is repeated for every list of operators resulting in total of:<br>
```
1024 = lists of operators
720  = lists of permutations

1024 * 720 = 737280

737280 = total number of equations created
```
This is a **Brute-Force** algorithm, I'm checking every possible equation this way. I completely understand that there is repeated equations that are checked and that there are equations that are negative or equal to a fraction and creating checks for this could greatly improve the execution speed but due to pressure from other modules and lack of knowledge I was limited with implementing such checks.

### Actual Results (ScreenShots)

**ScreenShot 1**
![image](http://i63.tinypic.com/20qjdjs.png)

**ScreenShot 2**
![image](http://i65.tinypic.com/2monw2d.png)

I talk about the results in-depth on the wiki page, follow the link below or access it through standard way.

### More on WIKI + WIKI Structure
[Countdown Game Wiki](https://github.com/PawelBor/Countdown-Numbers-Game/wiki) - My wiki for this project.
Contains most of my thoughts throughout the development process.<br>
Headings and what information is provided there.
*Note revisions*

1. Home
2. Logic Used
3. Code
4. Problems Encountered
5. References
6. Research + Thoughts
7. Results and Outcomes
8. Rules of the Game


Hope it explains all questions regarding any part of the code to whoever might ever read this and thank you for spending time reading it. Hope it may come in handy to whoever might want to implement this game in racket. Any changes are welcome and all code is under the MIT License.

### References
[Wikipedia - Permutation](https://en.wikipedia.org/wiki/Permutation) - Permutations Described<br>
[Wikipedia - Cartesian-Product](https://en.wikipedia.org/wiki/Cartesian_product) - Cartesian Product Described<br>
+Much More listed on Wiki.
