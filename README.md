# program-synthesis

## HW1 (bottom-up enumeration)

The code are located at `app/Main.hs` and `src/BruteForce.hs`. There are some sample test cases in `data/`.

To run, first do `stack build`, and then `stack run data/test[n].txt`.

Sample run: 
```
> stack run data/test5.txt
  (/ 2) . (- 5) . (* 9)
  (- 7) . (/ 2) . (* 9) . (+ 1)
  (/ 2) . (+ 4) . (* 9) . (- 1)
  (+ 2) . (/ 2) . (* 9) . (- 1)
  (/ 2) . (- 5) . (* 9) . (* 1)
  (/ 4) . (* 9) . (- 1) . (* 2)
  (/ 4) . (- 9) . (* 9) . (* 2)
  (/ 4) . (- 10) . (* 9) . (* 2)
  (/ 2) . (- 5) . (* 3) . (* 3)
  (/ 4) . (- 9) . (* 6) . (* 3)
```
The program returns at most 10 functions that correctly maps the inputs to outputs, ordered roughly by the "simplicity" of the functions.

Note: the functions are printed out in Haskell notation of function composition, i.e., the right-most operation executes first.


## HW2 (top-down search)

The code are located `app/Main.hs` and `src/TypeDirected.sh`. The test cases are written in the code file.

To run, modify `app/Main.hs` to select the test case, and then `stack run`.

Sample run:
```
> stack run
  map (map ((* 2)))
  map (map ((* 2) . (* 1)))
  map (map ((* 1) . (* 2)))
  map (map ((/ 1) . (* 2)))
  map (map ((/ 2) . (* 4)))
  map (map ((/ 3) . (* 6)))
  map (map ((/ 4) . (* 8)))
  map (map ((/ 5) . (* 10)))
  map (map ((* 2) . (/ 1)))
```
Currently, the functionality of the top-down search program is pretty limited: it only applies `map` to nested lists at appropriate places, and calls the brute force solver to do arithematics when it reaches the base case. `fold` will be implemented in the future.

Due to the unstructured approach I took during this and the previous homework, the program becomes harder and harder to maintain as complexity grows. I will try to resolve this by introducing more structures, e.g., building ASTs.
