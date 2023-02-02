module BruteForce (
    solve,
) where

nums :: [Int]
nums = [1 .. 10]

opNames :: [String]
opNames = ["+ ", "- ", "* ", "/ "]

ops :: [Int -> Int -> Int]
ops = map flip [(+), (-), (*), div]

moves :: [(Int -> Int, String)]
moves = possibleMoves (zip ops opNames) nums

searchSpace :: [(Int -> Int, String)]
searchSpace = level0 ++ level1 ++ level2 ++ level3
   where
    level0 = moves
    level1 = cartesian level0
    level2 = cartesian level1
    level3 = cartesian level2

possibleMoves :: [(Int -> Int -> Int, String)] -> [Int] -> [(Int -> Int, String)]
possibleMoves fs ns = [(f n, getName n name) | (f, name) <- fs, n <- ns]
  where
    getName n o = "(" ++ o ++ show n ++ ")"

cartesian :: [(Int -> Int, String)] -> [(Int -> Int, String)]
cartesian fs = [(f2 . f1, n2 ++ " . " ++ n1) | (f1, n1) <- fs, (f2, n2) <- moves]

solve :: [(Int, Int)] -> [(Int -> Int, String)]
solve pairs = filter checkPairs searchSpace
  where
    checkPairs (f, _) = foldr ((&&) . checkPair f) True pairs
    checkPair f (i, o) = f i == o
