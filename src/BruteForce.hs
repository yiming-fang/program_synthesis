module BruteForce (
  solve,
) where

moves :: [(Int -> Int, String)]
moves = possibleMoves (zip ops opNames) nums
 where
  nums = [1 .. 10]
  ops = map flip [(+), (-), (*), div]
  opNames = ["+", "-", "*", "/"]

searchSpace :: [(Int -> Int, String)] -> [(Int -> Int, String)]
searchSpace space = space ++ searchSpace (cartesian space)

possibleMoves :: [(Int -> Int -> Int, String)] -> [Int] -> [(Int -> Int, String)]
possibleMoves fs ns = [(f n, getName n name) | (f, name) <- fs, n <- ns]
 where
  getName n o = "(" ++ o ++ " " ++ show n ++ ")"

cartesian :: [(Int -> Int, String)] -> [(Int -> Int, String)]
cartesian fs = [(f2 . f1, n2 ++ " . " ++ n1) | (f1, n1) <- fs, (f2, n2) <- moves]

solve :: [(Int, Int)] -> [(Int -> Int, String)]
solve pairs = filter checkPairs (searchSpace moves)
 where
  checkPairs (f, _) = all (checkPair f) pairs
  checkPair f (i, o) = f i == o
