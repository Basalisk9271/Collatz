//Gabe Imlay
//CSC330: Organization of Programming Languages
//Project 3: Collatz -> Go -> Recursive
//December 4th, 2022

package main

import "math"
import "fmt"
import "os"
import "strconv"

// Most of the following code looks very similar to my HappyNums project because the code is based off of that other project

type KVPair struct {
    key int64
    sequence int64 
}

func main () {
    var i int64;
    var sequence int64;

	num1,err := (strconv.ParseInt(os.Args[1],10, 64)) 		//get inputs from command line
	num2,err := (strconv.ParseInt(os.Args[2], 10, 64))
	
	if ( err != nil ){  							
        fmt.Println("Your inputs are invalid")
	}
    
    // if the first number is larger than the second number, swap the numbers
    if (num1 > num2) {
        num1, num2 = num2, num1
    }

    if (num1 == 0) {
        num1++
    }
    
    var collatzArray[10] KVPair
    for i = 0; i < 10; i++ { //initialize the array of structures
        collatzArray[i].key = 0
        collatzArray[i].key = 0
    }
    
    for i = num1; i < num2+1; i++ {
        sequence = collatzSeq(i)
		if (linearSearch(collatzArray, sequence) != 1){
            if(sequence > collatzArray[9].sequence){
                collatzArray[9].key = i;
                collatzArray[9].sequence = sequence;
            }
            collatzArray = BubbleSort(collatzArray, "v");
        }
    }
	fmt.Println("Sorted based on sequence length: ")
    
	for i = 0; i < 10; i++ {
		if (collatzArray[i].key != 0){
			fmt.Println(collatzArray[i].key, "		", collatzArray[i].sequence)
		}
			
	}

	collatzArray = BubbleSort(collatzArray, "k");

	fmt.Println("Sorted based on integer size: ")
    
	for i = 0; i < 10; i++ {
		if (collatzArray[i].key != 0){
			fmt.Println(collatzArray[i].key, "		", collatzArray[i].sequence)
		}
			
	}
    
    
    
}

func collatzSeq(param int64) int64 {
    var number int64;
    var sequence int64;
    number = param
	sequence = 0
	if (number != 1){
		if (math.Mod(float64(number),2) == 0){
			number = number/2
		}else{
			number = number*3+1
		}
		sequence = collatzSeq(number) + 1
	}else{
		return 0
	}
    
    return sequence;

}

//Bubble sort from https://www.tutorialspoint.com/bubble-sort-in-go-lang to sort my array of structs
func BubbleSort(array[10] KVPair, sortBy string)[10]KVPair {
    if (sortBy == "v"){
	for i:=0; i< len(array)-1; i++ {
       for j:=0; j < len(array)-i-1; j++ {
          if (array[j].sequence < array[j+1].sequence) {
             array[j], array[j+1] = array[j+1], array[j]
          }
       }
    }	
	}
	if (sortBy == "k"){
	for i:=0; i< len(array)-1; i++ {
		for j:=0; j < len(array)-i-1; j++ {
			if (array[j].key < array[j+1].key) {
				array[j], array[j+1] = array[j+1], array[j]
			}
		}
	}	
	}
	
    return array
 }
 
 func linearSearch(array[10] KVPair, search int64) int32 {
    var searched int32
	searched = -1
	for i:=0; i< len(array)-1; i++ {
       if (array[i].sequence == search){
			searched = 1
	   }
    }
    return searched
 }