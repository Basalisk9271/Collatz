#!/usr/bin/sbcl --script

; Gabe Imlay
; CSC330: Organization of Programming Languages
; Project 3: Collatz -> Julia -> Iterative
; December 4th, 2022

; Most of the following code looks very similar to my HappyNums project because the code is based off of that other project

; I did not use structs in this language because it seemed simpler to use two global arrays for the functions while 
; just performing the same operations on both of the arrays when I would sort them

(defvar keyArr)
(defvar seqArr)

(defun collatzSeq ( param )
  (let (number seq)
  (setq number param)
  (setq seq 0)
  (loop while (/= number 1)
    do
      (if (= (mod number 2) 0)
        (progn
        (setq number (/ number 2))
        )
        (progn
          (setq number (+ (* number 3) 1))
        )
      )
      (setq seq (+ seq 1)) 
  )
  seq
  )
)

(defun bubbleSort (sortBy)
  (if (= sortBy 1)
  (dotimes(i(1-(length seqArr)) seqArr)
    (dotimes(j(-(length seqArr) i 1))
      (if(<(aref seqArr j)(aref seqArr(+ 1 j)))
        (progn
        (rotatef (aref keyArr j)(aref keyArr(+ 1 J)))
        (rotatef (aref seqArr j)(aref seqArr(+ 1 J))))))))
  (if (= sortBy 2)
  (dotimes(i(1-(length keyArr)) keyArr)
    (dotimes(j(-(length keyArr) i 1))
      (if(<(aref keyArr j)(aref keyArr(+ 1 j)))
        (progn
        (rotatef (aref keyArr j)(aref keyArr(+ 1 J)))
        (rotatef (aref seqArr j)(aref seqArr(+ 1 J))))))))
)

(defun linearSearch (search)
  (let (searched)
  (setq searched 0)
  (dotimes(i(1-(length seqArr)) seqArr)
    (if (= (aref seqarr i) search)
      (setq searched 1)
    )
  )
  searched
  )
  )

; Here is the main program
(progn
  (defvar lowerBound)
  (defvar upperBound)
  (defvar seq)

  (setf keyArr (make-array '(10)))
  (setf seqArr (make-array '(10)))
  
  (setf lowerbound (parse-integer (nth 1 *posix-argv*)))
  (setf upperbound (parse-integer (nth 2 *posix-argv*)))

  (if (> lowerBound upperBound)
    (rotatef lowerBound upperBound)
  ) 
  
  ; If number 1 is 0, skip to 1 so it does not break the program logic
  (if (= lowerBound 0)
    (setq lowerBound (+ lowerBound 1))
  ) 

  ; Initializes my arrays with zeros in them 
  (loop for x from 0 to 9
    do
      (setf (aref keyArr x) 0)
      (setf (aref seqArr x) 0)
  )

  (loop for x from lowerBound to upperBound
    do
      (setq seq (collatzseq x))
      (if (/= (linearsearch seq) 1)
        (progn
          
          (if (> seq (aref seqArr 9))
          (progn
            (setf (aref keyArr 9) x)
            (setf (aref seqArr 9) seq)
          )
          )
          ; sort the arrays by the sequence number values
          (bubbleSort 1))
      )
  )

  (princ "Sorted based on sequence length: ")
  (terpri)
  (loop for x from 0 to 9
      do
        (if(/= (aref keyArr x) 0)
          (progn
          (princ (aref keyarr x))
          (princ "        ")
          (princ (aref seqarr x))
          (terpri))))

  ; sort the arrays based on the integer values
  (bubblesort 2)

  (princ "Sorted based on integer size: ")
  (terpri)
  (loop for x from 0 to 9
      do
        (if(/= (aref keyArr x) 0)
          (progn
          (princ (aref keyarr x))
          (princ "        ")
          (princ (aref seqarr x))
          (terpri))))
        

  )

