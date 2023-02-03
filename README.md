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
