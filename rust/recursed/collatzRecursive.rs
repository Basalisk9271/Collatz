//Gabe Imlay
//CSC330: Organization of Programming Languages
//Project 3: Collatz -> Rust -> Recursive
//December 4th, 2022

use std::env;

// main function to run the majority of the program's algorithm
fn main () {
    let args: Vec<String> = env::args().collect();
    let num = &args[1];
    let num2 = &args[2];
    let temp = num.trim().parse::<i32>().expect("Item not integer");
    let temp2 = num2.trim().parse::<i32>().expect("Item not integer");
    let lower_bound: u64 = temp as u64;
    let upper_bound: u64 = temp2 as u64;
    let mut key_arr:[i64;10] = [0;10];
    let mut seq_arr:[i64;10] = [0;10];
    let mut _sequence = 0;

    for i in lower_bound..upper_bound{
        _sequence = collatz_seq(i as i64);
        if linear_search(seq_arr, _sequence) != 1 {
            if _sequence > seq_arr[9] {
                key_arr[9] = i as i64;
                seq_arr[9] = _sequence;
            }
            bubble_sort(&mut key_arr, &mut seq_arr, "v");
        }
    }

    println!("Sorted based on sequence length: ");

    for i in 1..10 {
        if key_arr[i] != 0 {
            println!("{}        {}", key_arr[i], seq_arr[i]);
        }
    }

    bubble_sort(&mut key_arr, &mut seq_arr, "k");

    println!("Sorted based on integer size: ");

    for i in 1..10 {
        if key_arr[i] != 0 {
            println!("{}        {}", key_arr[i], seq_arr[i]);
        }
    }
}

// determines the sequrnce value for a given number
fn collatz_seq(param: i64)-> i64{
    let mut _sequence = 0;
    let mut number = param;
    if number != 1 {
        if number % 2 == 0{
            number = number/2;
        }else {
            number = number * 3 + 1;
        }
        _sequence = collatz_seq(number) + 1;
    }else{
        return 0;
    }
    return _sequence;
}

// bubble sorts the arrays in descending order based on the key values or the sequence values
fn bubble_sort(key_arr: &mut [i64;10], seq_arr: &mut [i64;10], sort_by: &str){
    if sort_by.trim() == "v" {
        for i in 1..10 {
            for j in 1..(10 - i) {
                if seq_arr[j] < seq_arr[j+1]{
                    seq_arr.swap(j, j+1);
                    key_arr.swap(j, j+1);
                }
            }
        }
    }
    if sort_by.trim() == "k" {
        for i in 1..10 {
            for j in 1..(10 - i) {
                if key_arr[j] < key_arr[j+1]{
                    seq_arr.swap(j, j+1);
                    key_arr.swap(j, j+1);
                }
            }
        }
    }
}

// linear search to find whether a sequence value is already in the array
fn linear_search(array: [i64;10], search: i64 )-> i32{
    let mut searched = -1;
    for i in 1..10 {
        if array[i] == search {
            searched = 1;
        }
    }

    return searched;
}