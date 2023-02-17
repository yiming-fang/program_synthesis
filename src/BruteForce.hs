module BruteForce (
  solve,
) where

type FuncList = [(Int -> Int, String)]

moves :: FuncList
moves = possibleMoves (zip ops opNames) nums
 where
  nums = [1 .. 10]
  ops = map flip [(+), (-), (*), div]
  opNames = ["+", "-", "*", "/"]
  possibleMoves fs ns = [(f n, getName n name) | (f, name) <- fs, n <- ns]
  getName n o = "(" ++ o ++ " " ++ show n ++ ")"

searchSpace :: FuncList -> FuncList
searchSpace space = space ++ searchSpace (cartesian space)

cartesian :: FuncList -> FuncList
cartesian fs = [(f2 . f1, n2 ++ " . " ++ n1) | (f1, n1) <- fs, (f2, n2) <- moves]

solve :: [(Int, Int)] -> FuncList
solve pairs = filter checkPairs limitedSpace
 where
  checkPairs (f, _) = all (\(i, o) -> f i == o) pairs
  limitedSpace = take limit $ searchSpace moves
  limit = 100000000
  