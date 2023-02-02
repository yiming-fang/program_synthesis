{-# OPTIONS_GHC -Wno-missing-export-lists #-}
module Main where

import BruteForce (solve)
import System.Environment (
  getArgs,
  getProgName,
 )
import System.Exit (die)

main :: IO ()
main = do
  args <- getArgs
  case args of
    [filename] -> do
      contents <- readFile filename
      let input = (map extractLine . lines) contents
          res = solve input
          (funcs, funcNames) = unzip $ take 10 res
      mapM_ putStrLn funcNames
    _ -> do
      pn <- getProgName
      die $ "Usage: " ++ pn ++ "<filename>"

extractLine :: String -> (Int, Int)
extractLine str = case words str of
  l : [r] -> (read l, read r)
  _ -> (-1, -1)
