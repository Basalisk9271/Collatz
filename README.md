# Project 3 - The Collatz Conjecture

## Description
Write a program in different languages (Fortran, Julia, Go, Lisp, and Rust) that takes an command line integer arguments for a range of numbers. Then, the program will calculate the sequences of the numbers in accordance with the Collatz Conjecture before storing the top ten numbers in descending order by the amount of values in their sequence. Then, they'll be sorted by the value of each starting number. These two sorts will be output onto the screen so the user can see them. 

*DISCLAIMER: The user must remember to add their command line arguments when calling the various versions of the program. Failure to do so will break the program in a way that exits the program run*

## Functions
This is a list of the functions included in the various iterations of this program

- `collatzSeq()` - This function implements the collatz conjecture rules and returns a count of the numbers in the sequence. This function is the only one that changes between the iterative and recursive versions of the programs. 
- `BubbleSort()` - This function implements a bubble sort that has two different options depending on whether the user needs to sort by the integer numbers in descending order or the sequence counts in descending order. The choice is made by passing in a specific parameter usually in the form of a string or character. 
- `linearSearch()` - This function searches the array to see if there is an entry that contains the same number for it's sequence count. The variable `searches` is defaulted to a -1 and will change to a 1 if there is an entry found that has the same number of sequence counts. Since the program runs from the lowest argument to the largest one, the lowest integer with the duplicate sequence count will be chosen for the array. This search is not the most efficient, but it will only be searching an array that is a max of 10 items long, which makes it a prime candidate for a nice, easy search to implement. This function returns an integer that can be used in the program logic. 

## File Structure
This project contains folders named for the language that they hold in them. There is a subdirectory in each folder called `recursed`. The recursive version of each of the programs is stored in this subdirectory. This is a feature and not a bug...

## Authors and Acknowledgment
Gabe Imlay

## Project status
 -- In Progress -- 

## Langauges 


#### *DISCAIMER: For the purpose of the example calls, the arguments being used in the run commands are the same input that was given to us by Dr. Pounds.*
---
### Fortran

**Compilation:** 

Iterative Version:
```
gfortran -O2 collatz.f95 -o collatz
```
To execute, run:
```
./collatz 50 100
```

Recursive Version:
```
gfortran -O2 collatzRecursive.f95 -o collatzR
```
To execute, run:
```
./collatzR 50 100
```
--- 
### Go

**Compilation:** Similar to Python, this can be achieved by running the single command below on both the iterative version of the program and the recursive version stored in the `recursed` folder. 

Iterative Version:
```
go run collatz.go 50 100
```

Recursive Version:
```
go run collatzRecursive.go 50 100
```
--- 
### Julia

**Compilation:** 

Iterative Version: You'll need to make the file executable if it is not already by using `chmod 700 collatz.jl`. Then, run the command below to execute. 
```
./collatz.jl 50 100
```

Recursive Version: You'll need to make the file executable if it is not already by using `chmod 700 collatzRecursive.jl`. Then, run the command below to execute. 
```
./collatzRecursive.jl 50 100
```
--- 
### Lisp

**Compilation:** 

Iterative Version: You'll need to make the file executable if it is not already by using `chmod 700 collatz.lisp`. Then, run the command below to execute. 
```
./collatz.lisp 50 100
```

Recursive Version: You'll need to make the file executable if it is not already by using `chmod 700 collatzRecursive.lisp`. Then, run the command below to execute. 
```
./collatzRecursive.lisp 50 100
```
--- 
### Rust

**Compilation:** 

Iterative Version:
```
rustc -O collatz.rs
```
To execute, run:
```
./collatz 50 100
```

Recursive Version:
```
rustc -O collatzRecursive.rs
```
To execute, run:
```
./collatzRecursive 50 100
```
--- 

