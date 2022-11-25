# Project 3 - The Collatz Conjecture

## Description
Write a program in different languages (Fortran, Julia, Go, Lisp, and Rust) that takes an command line integer arguments for a range of numbers. Then, the program will calculate the sequences of the numbers in accordance with the Collatz Conjecture before storing the top ten numbers in descending order by the amount of values in their sequence. Then, they'll be sorted by the value of each starting number. These two sorts will be output onto the screen so the user can see them. 

## Authors and Acknowledgment
Gabe Imlay

## Project status
 -- In Progress -- 

## Langauges 

---
### Fortran

**Compilation:** 

Iterative Version:
```
gfortran -O2 collatz.f95 -o collatz
```
To execute, run:
```
./collatz
```

Recursive Version:
```
gfortran -O2 collatzRecursive.f95 -o collatzR
```
To execute, run:
```
./collatzR
```
--- 
### Go

**Compilation:** Similar to Python, this can be achieved by running the single command below on both the iterative version of the program and the recursive version stored in the `recursed` folder. 

Iterative Version:
```
go run collatz.go
```

Recursive Version:
```
go run collatzRecursive.go
```
--- 
### Julia

**Compilation:** 

Iterative Version: You'll need to make the file executable if it is not already by using `chmod 700 collatz.jl`. Then, run the command below to execute. 
```
collatz.jl
```

Recursive Version: You'll need to make the file executable if it is not already by using `chmod 700 collatzRecursive.jl`. Then, run the command below to execute. 
```
collatzRecursive.jl
```
--- 
### Lisp

**Compilation:** 

Iterative Version: You'll need to make the file executable if it is not already by using `chmod 700 collatz.lisp`. Then, run the command below to execute. 
```
collatz.lisp
```

Recursive Version: You'll need to make the file executable if it is not already by using `chmod 700 collatzRecursive.lisp`. Then, run the command below to execute. 
```
collatzRecursive.lisp
```
--- 
### Rust

**Compilation:** 

**Compilation:** 

Iterative Version:
```
rustc -O collatz.rs
```
To execute, run:
```
./collatz
```

Recursive Version:
```
rustc -O collatzRecursive.rs
```
To execute, run:
```
./collatzRecursive
```
--- 

