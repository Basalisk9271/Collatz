!Gabe Imlay
!CSC330: Organization of Programming Languages
!Project 3: Collatz -> Fortran -> Iterative
!December 4th, 2022

!Most of the following code looks very similar to my HappyNums project because the code is based off of that other project

PROGRAM Collatz
    IMPLICIT NONE
    
    type KVPair !Struct to hold my happyNums and Norms values for printing
        integer :: key
        integer (kind = 8):: sequence
    end type

    integer :: lowerBound, upperBound, temp, i
    integer (kind = 8):: sequence
    type(KVPair), dimension(10) :: collatzArray
    character (100) :: LB, UB

    call get_command_argument(1,LB)
    call get_command_argument(2,UB)

    !write(*,"(A)",advance="no") "First Argument: "
    read (LB,*) lowerBound
    read (UB,*) upperBound
    !write(*,"(A)",advance="no") "Second Argument: "
    !read *,upperBound

    if ( lowerBound > upperBound ) then
        temp = upperBound
        upperBound = lowerBound
        lowerBound = temp
    end if

    if ( lowerBound == 0) then
        lowerBound = lowerBound + 1
    end if

    !Initialize array of structures
    do i = 1, 10
        collatzArray(i)%key = 0
        collatzArray(i)%sequence = 0
    end do

    do i = lowerBound, upperBound
        sequence = collatzSeq(i)
        if (linearSearch(collatzArray, sequence) /= 1) then
            if ( sequence > collatzArray(10)%sequence ) then
                collatzArray(10)%key = i
                collatzArray(10)%sequence = sequence
            end if
            call Bubble_Sort('v', collatzArray)
        end if
    end do

    write(*,"(A)",advance="yes") "Sorted based on sequence length: "
    
    do i = 1, 10
        if ( collatzArray(i)%key /= 0 ) then
            WRITE(*, '(i0)', advance="no") collatzArray(i)%key
            write(*,"(A)",advance="no") "       "
            WRITE(*, '(i0)', advance="yes") collatzArray(i)%sequence
        end if
    end do

    call Bubble_Sort('k', collatzArray)
    write(*,"(A)",advance="yes") "Sorted based on integer size: "
    
    do i = 1, 10
        if ( collatzArray(i)%key /= 0 ) then
            WRITE(*, '(i0)', advance="no") collatzArray(i)%key
            write(*,"(A)",advance="no") "       "
            WRITE(*, '(i0)', advance="yes") collatzArray(i)%sequence
        end if
    end do
    

    contains
    
    integer (kind = 8) function collatzSeq(param)
        IMPLICIT NONE
        integer :: number, param
        integer(kind = 8) :: temp
        integer (kind = 8):: sequence
        sequence = 0
        number = param  !  Creates local copy of paramter that can be changed since Fortran is pass by reference
        do while (number /= 1) 
            if (mod(number,2) == 0) then 
                number = number / 2 
            else
                number = number*3 + 1 
            end if
            sequence = sequence + 1
        end do
        collatzSeq = sequence
    end function

    !This bubble sort is one found on Rosetta Code and tweaked to bubble sort my array of structs
    !found here https://rosettacode.org/wiki/Sorting_algorithms/Bubble_sort#Fortran
    SUBROUTINE Bubble_Sort(sortBy, a)
        character(len=1) :: sortBy
        type(KVPair), DIMENSION(:) :: a
        type(KVPair) :: temp
        INTEGER :: i, j
        LOGICAL :: swapped
       
       if (sortBy == 'v')then
        DO j = SIZE(a)-1, 1, -1
          swapped = .FALSE.
          DO i = 1, j
            IF (a(i)%sequence < a(i+1)%sequence) THEN
              temp = a(i+1)
              a(i+1) = a(i)
              a(i) = temp
              swapped = .TRUE.
            END IF
          END DO
          IF (.NOT. swapped) EXIT
        END DO
        else if (sortBy == 'k') then
            DO j = SIZE(a)-1, 1, -1
            swapped = .FALSE.
            DO i = 1, j
                IF (a(i)%key < a(i+1)%key) THEN
                temp = a(i+1)
                a(i+1) = a(i)
                a(i) = temp
                swapped = .TRUE.
                END IF
            END DO
            IF (.NOT. swapped) EXIT
            end do
        end if
      END SUBROUTINE

      integer function linearSearch(a, search)
        type(KVPair), DIMENSION(:) :: a
        INTEGER :: i, j, searched
        integer (kind=8) :: search
        searched = -1
        do i = 1, size(a)-1
            if (a(i)%sequence .eq. search) then
                searched = 1
            end if
        end do
       
       linearSearch = searched
      END function
END PROGRAM Collatz