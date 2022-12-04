#!/usr2/local/julia-1.8.2/bin/julia

# Gabe Imlay
# CSC330: Organization of Programming Languages
# Project 3: Collatz -> Julia -> Recursive
# December 4th, 2022

# Most of the following code looks very similar to my HappyNums project because the code is based off of that other project

mutable struct KVPair
    key::Int64
    sequence::Int64
end

function main()
    num1 = parse(Int64,ARGS[1])
    num2 = parse(Int64,ARGS[2])

    if num1 > num2
        num1, num2 = num2, num1
    end
    if num1 == 0
        num1 = num1 + 1
    end
    collatzArr = Vector{KVPair}(undef, 10)
    
    for i = 1:10
        collatzArr[i] = KVPair(0,0)
    end
    
    for i = num1:num2
        sequence = collatzSeq(i)
        if linearSearch(collatzArr, sequence) != 1
            if sequence > collatzArr[10].sequence
                collatzArr[10].key = i
                collatzArr[10].sequence = sequence
            bubbleSort(collatzArr, "v")
            end
        end
    end

    print("Sorted based on sequence length: \n")

    for i = 1:10
        if collatzArr[i].key != 0
           print(collatzArr[i].key, "		", collatzArr[i].sequence, "\n") 
        end
    end

    bubbleSort(collatzArr, "k")

    print("Sorted based on integer size: \n")

    for i = 1:10
        if collatzArr[i].key != 0
           print(collatzArr[i].key, "		", collatzArr[i].sequence, "\n") 
        end
    end
end 

function collatzSeq(param)
    sequence = 0
    number = param
    if number != 1
        if mod(number,2) == 0
            number = number/2
        else
            number = number*3+1
        end
        sequence = collatzSeq(number) + 1 
    else
        return 0
    end
    return sequence
end

function bubbleSort(collatzArr, sortBy)
    if sortBy == "v"
        for i = 1: length(collatzArr)
            for j = 1:length(collatzArr)-i
                if collatzArr[j].sequence < collatzArr[j+1].sequence
                   collatzArr[j], collatzArr[j+1] = collatzArr[j+1], collatzArr[j]
                end
            end
        end 
    end
    if sortBy == "k"
        for i = 1: length(collatzArr)
            for j = 1:length(collatzArr)-i
                if collatzArr[j].key < collatzArr[j+1].key
                    collatzArr[j], collatzArr[j+1] = collatzArr[j+1], collatzArr[j]
                end
            end
        end 
    end
end

function linearSearch(array, search)
    searched = -1

    for i=1:length(array)
        if array[i].sequence == search
            searched = 1
        end
    end

    return searched
end


main()