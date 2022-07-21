# combisumii: Combination Sum II

Learning project in ⚡️ Zig ⚡️ attempting to solve the following problem:

![Combination Sum II](https://files.catbox.moe/ijje7b.jpg)

Based on this, my objectives for this project are to:

- [x] Create a function that generates random length for the candidates array (1-100 elements) and generates random values for the candidates (velues between 1-50).
- [x] Create a function that generates a random target (1-30).
- [ ] Create a function that matches which candidates can be added together to product the target.
- [ ] Pull all of these functions together to produce a program that generates a random target value and an array of random candidates values, and prints out all combinations of candidate values that sum to the target value - these must only be used once and the same sum should never appear twice (eg. 1+2+1=4 and 2+1+1=4).

The plan is to implement an array of a random length (between 1 and 100 elements) and populate those elements with random values (between 1 and 50) and then find all unique combinations which sum to a random target value (between 1 and 30).

Notes/thoughts:
- Run through the array elements and nullify all values >= the taget value.
- More to come!