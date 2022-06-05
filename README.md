# Functional-Programming-through-Haskell
# Problem discription 
Consider a small binary image (or matrix) that is represented as a list of lists which contains
only the numbers 0 or 1, e.g.,
<img src=https://github.com/Mohammedshaad99/QuantumComputing/image/circuit-diagram.jpeg></img>
We wish to find the number of pixels in the largest connected component of such images
(there can of course be more than one component with the same largest number). A connected component is a cluster of pixels that contain the same value and there is a path from
each pixel to each other pixel inside that cluster. A path is formed from a start pixel by moving either horizontally (one element left or right in the same inner list) or vertically (one list up
or down in the outer list without changing the position in the inner list) to the next pixel until
the end pixel is reached (this is 4-pixel connected, i.e. no diagonal movement). The number
of elements in the largest connected component for the value 0 in the above example is 4
(among the 4 components). It is 19 for the value 1 (there is only one component).
# Task 1:
Write an efficient Haskell function nlcc l v that finds the number of elements in the largest
connected component of the binary image (list of lists) l for the value v. Note, there are
multiple, more or less efficient algorithms to solve this problem - make sure you clearly
document your approach. Also note, you must write a function, not a full program (so no
main, etc).
Note that you must write your own code to solve this problem and not just call a library
function. You may use the standard libraries listed in the Haskell 2010 language report, but
not any other libraries.
# Task 2: 
Write a short report on functional programming related to the problem:
1. Provide, in up to 300 words, two arguments for and two arguments against using
functional programming to solve the problem.
2. Discuss, in up to 300 words, whether the functional programming paradigm is suitable
for this problem or whether another paradigm of your choice is more appropriate,
based on your previous arguments.
